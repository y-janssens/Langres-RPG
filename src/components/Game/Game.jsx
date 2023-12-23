import { useRef, useMemo, useCallback } from 'react';
import { useGet, useDynamicForm, useGameContext, useTranslation } from '../../hooks';
import { GameModel, Environment } from '../../models';

import { Hud } from './Interface/Hud';
import { LoadingScreen } from '../ui/LoadingScreen';
import { MapLayout } from './map/MapLayout';
import { InGameMenu } from '../Menu/InGameMenu';
import PauseScreen from '../ui/PauseScreen';
import Scene from './Scene/Scene';

export const Game = ({ keyToggles, pause, position, setPosition }) => {
    const { t } = useTranslation();
    const [context, setContext, removeFromContext] = useGameContext();

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
                let game = new GameModel({ ...response, context });
                const currentAct = game.current_act;
                const currentWorld = game.current_world;
                const openingTitle = game.title;
                if (!game.has_position || context.mapId) {
                    game.last_known_position = { x: currentWorld.starting_point.x, y: currentWorld.starting_point.y };
                }

                context.controls.positions = [-game.last_known_position.x, 0.75, -game.last_known_position.y];
                setPosition(context.controls.positions);
                setContext({ controls: context.controls, world: currentWorld });
                setFormObject({ ...form, ...game, world: currentWorld, act: currentAct, openingTitle });
                game.save();
            }
        },
        [context?.gameId, context?.mapId]
    );

    const handleGateWay = useCallback(
        async (gateway) => {
            let game = new GameModel(form);
            if (gateway.map && Boolean(gateway.is_final)) {
                let act = game.storyline.story.acts.find((act) => act.id === form.act.id);
                act.content.maps.find((mp) => mp.id === form.world.id).complete = true;
            }
            game.save().then(() => {
                if (form.world.primary) {
                    setContext({ mapId: { id: gateway.map, is_final: gateway.is_final } });
                } else {
                    removeFromContext('mapId');
                }
                setFormObject({ ...form, loadingProgress: 0, loadingReady: false });
            });
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
