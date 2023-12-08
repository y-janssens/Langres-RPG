import { useEffect, useState, useRef, useMemo } from 'react';
import { useGet, useDynamicForm, useGameContext, useTranslation } from '../../hooks';
import { GameModel, World, Environment } from '../../models';

import { Hud } from './Interface/Hud';
import { LoadingScreen } from '../ui/LoadingScreen';
import { MapLayout } from './map/MapLayout';
import { InGameMenu } from '../Menu/InGameMenu';
import PauseScreen from '../ui/PauseScreen';
import Scene from './Scene/Scene';

// eslint-disable-next-line
export const Game = ({ game, keyToggles, pause, position, setPosition }) => {
    const { t } = useTranslation();
    const [context, setContext] = useGameContext();
    const [gameMap, setGameMap] = useState([]);

    const cameraRef = useRef();
    const characterRef = useRef();
    const pointLightRef = useRef();

    const [form, setForm, setFormObject] = useDynamicForm({
        id: null,
        environment: {}
    });

    const [, loading] = useGet(
        {
            func: 'load_game',
            id: parseInt(context?.gameId),
            launch: context?.gameId,
            onSuccess: (response) => {
                const currentAct = response.storyline.story.acts.find((act) => !act.complete);
                const currentMap = currentAct.content.maps.find((mp) => !mp.complete);
                setFormObject(response);
                let game = new GameModel(response);
                let world = new World(currentMap);
                let _world = world.parse();
                let grid = world.grid;
                setGameMap(_world);
                context.controls.positions = [-world.starting_point.x, 0.75, -world.starting_point.y];
                setPosition([-world.starting_point.x, 0.75, -world.starting_point.y]);
                setContext({ game, world, map: _world, grid, controls: context.controls, act: currentAct });

                if (response.save_count < 1) {
                    game.save();
                }
            }
        },
        [context?.gameId]
    );

    const [, loadingEnvironment] = useGet({
        func: 'load_env',
        payload: { date: context?.act?.date },
        launch: form.id,
        onSuccess: (response) => {
            setForm('environment', new Environment({ ...response, locale: context.applicationData.language, season: t(`environment.seasons.${response.season}`) }));
        }
    });

    const contextReady = useMemo(() => {
        if (!context) {
            return false;
        }
        const expectedKeys = ['assets', 'controls', 'gameId', 'world', 'map', 'applicationData'];
        return Boolean(expectedKeys.every((key) => Object.prototype.hasOwnProperty.call(context, key)));
    }, [context]);

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        if (!context.controls.toggles.input && !pause) {
            game.current.focus();
        }
    }, [context, pause]);

    if (!context?.gameId) {
        return null;
    }

    return (
        <>
            <InGameMenu id={context?.gameId} game={game} />
            <PauseScreen ready={contextReady} context={context} />
            <LoadingScreen context={context} loading={!form.id || loading || !contextReady || loadingEnvironment}>
                <Hud context={context} game={form} display={keyToggles} position={position} />
                <Scene context={context} lightRef={pointLightRef} cameraRef={cameraRef} pause={pause}>
                    <MapLayout world={context.world} data={gameMap} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} />
                </Scene>
            </LoadingScreen>
        </>
    );
};
