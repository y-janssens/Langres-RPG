import { useRef, useMemo, useCallback } from 'react';
import { useGet, useDynamicForm, useGameContext, useTranslation } from '../../hooks';
import { GameModel, World, Environment } from '../../models';

import { Hud } from './Interface/Hud';
import { LoadingScreen } from '../ui/LoadingScreen';
import { MapLayout } from './map/MapLayout';
import { InGameMenu } from '../Menu/InGameMenu';
import PauseScreen from '../ui/PauseScreen';
import Scene from './Scene/Scene';

export const Game = ({ keyToggles, pause, position, setPosition }) => {
    const { t } = useTranslation();
    const [context, setContext] = useGameContext();

    const cameraRef = useRef();
    const characterRef = useRef();
    const pointLightRef = useRef();

    const [form, setForm, setFormObject] = useDynamicForm({
        id: null,
        environment: {},
        loadingProgress: 0,
        loadingReady: false
    });

    const [, loading] = useGet(
        {
            func: 'load_game',
            id: parseInt(context?.gameId),
            launch: context?.gameId || context?.mapId,
            onSuccess: (response) => {
                let resp = new GameModel(response);
                const currentAct = response.storyline.story.acts.find((act) => !act.complete);
                const currentMap = currentAct.content.maps.find((mp) => (context.mapId ? mp.id === context?.mapId : !mp.complete));
                const world = new World(currentMap);
                const position = resp.has_position ? resp.last_known_position : world.starting_point;

                if (!resp.has_position) {
                    resp.last_known_position = { x: world.starting_point.x, y: 0.75, z: world.starting_point.y };
                }

                context.controls.positions = [-position.x, 0.75, -position.z];
                setPosition(context.controls.positions);
                setContext({ controls: context.controls, world });
                setFormObject({ ...form, ...resp, world, act: currentAct });

                if (response.save_count <= 1) {
                    resp.save();
                }
            }
        },
        [context?.gameId, context?.mapId]
    );

    const handleGateWay = useCallback(
        (id) => {
            setContext({ mapId: id });
            setFormObject({ ...form, loadingProgress: 0, loadingReady: false });
        },
        [form]
    );

    const [, loadingEnvironment] = useGet({
        func: 'load_env',
        payload: { date: form?.act?.date },
        launch: form.id,
        onSuccess: (response) => {
            const environment = new Environment({
                ...response,
                locale: context.applicationData.language,
                season: t(`environment.seasons.${response.season}`)
            });
            setForm('environment', environment);
        }
    });

    const contextReady = useMemo(() => {
        if (!context) {
            return false;
        }
        const expectedKeys = ['controls', 'gameId', 'applicationData'];
        return Boolean(expectedKeys.every((key) => Object.prototype.hasOwnProperty.call(context, key)));
    }, [context]);

    return (
        <>
            {context?.gameId && context.controls.toggles.menu && <InGameMenu id={context?.gameId} form={form} />}
            <PauseScreen ready={contextReady} context={context} />
            <LoadingScreen form={form} setForm={setForm} context={context} loading={!form.id || loading || !contextReady || loadingEnvironment}>
                <Hud context={context} game={form} display={keyToggles} position={position} />
                <Scene context={context} lightRef={pointLightRef} cameraRef={cameraRef} pause={pause}>
                    <MapLayout form={form} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} handleGateWay={handleGateWay} />
                </Scene>
            </LoadingScreen>
        </>
    );
};
