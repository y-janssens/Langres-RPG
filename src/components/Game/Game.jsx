import { useEffect, useState, useRef, useMemo } from 'react';
import { useGet, useForm, useGameContext } from '../../hooks';
import { GameModel, World } from '../../models';

import { Hud } from './Interface/Hud';
import { LoadingScreen } from '../ui/LoadingScreen';
import { MapLayout } from './map/MapLayout';
import { InGameMenu } from '../Menu/InGameMenu';
import PauseScreen from '../ui/PauseScreen';
import Scene from './Scene/Scene';

// eslint-disable-next-line
export const Game = ({ game, keyToggles, pause, position, setPosition }) => {
    const [context, setContext] = useGameContext();
    const [gameMap, setGameMap] = useState([]);

    const cameraRef = useRef();
    const characterRef = useRef();
    const pointLightRef = useRef();

    const [form, , setFormObject] = useForm({
        id: null
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
                setContext({ game, world, map: _world, grid });

                if (response.save_count < 1) {
                    game.save();
                }
            }
        },
        [context?.gameId]
    );

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
            <LoadingScreen context={context} loading={!form.id || loading || !contextReady}>
                <Hud context={context} game={form} display={keyToggles} position={position} />
                <Scene context={context} lightRef={pointLightRef} cameraRef={cameraRef} pause={pause}>
                    <MapLayout world={context.world} data={gameMap} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} />
                </Scene>
            </LoadingScreen>
        </>
    );
};
