import { useEffect, useState, useRef, useMemo } from 'react';
import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import { useGet } from '../../hooks/useGet';
import { GameModel, World, Codes } from '../../models';
import { useForm } from '../../hooks/useForm';
import useGameContext from '../../hooks/useGameContext';

import { Hud } from './Interface/Hud';
import { LoadingScreen } from '../ui/LoadingScreen';
import { MapLayout } from './map/MapLayout';
import { InGameMenu } from '../Menu/InGameMenu';
import PauseScreen from '../ui/PauseScreen';

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
                setFormObject(response);
                let game = new GameModel(response);
                let codes = new Codes();
                let world = new World(response.world);
                let _world = world.parse();
                setGameMap(_world);
                setContext({ game, world, map: _world, codes });

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
        if (!context.controls.toggles.input) {
            game.current.focus();
        }
    }, [context]);

    if (!context?.gameId) {
        return null;
    }

    return (
        <>
            <InGameMenu id={context?.gameId} game={game} />
            <PauseScreen ready={contextReady} context={context} />
            <LoadingScreen context={context} loading={!form.id || loading || !contextReady}>
                <Hud context={context} game={form} display={keyToggles} position={position} />
                {context.display3d && (
                    <Canvas
                        shadows
                        frameloop={pause ? 'never' : 'always'}
                        camera={{
                            position: [0, 15, -18.86],
                            fov: 25,
                            zoom: 1.25
                        }}
                    >
                        <SceneSettings lightRef={pointLightRef} cameraRef={cameraRef}>
                            <MapLayout world={form.world} data={gameMap} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} />
                        </SceneSettings>
                    </Canvas>
                )}
            </LoadingScreen>
        </>
    );
};

function SceneSettings({ cameraRef, lightRef, children }) {
    return (
        <>
            <color attach="background" args={[0, 0, 0]} />
            <fogExp2 attach="fog" color="black" density={0.05} />
            <ambientLight intensity={0.5} />
            <pointLight
                castShadow
                shadow-mapSize-height={2048}
                shadow-mapSize-width={2048}
                shadow-radius={10}
                shadow-bias={-0.01}
                intensity={2500}
                position={[0, 10, 0]}
                decay={2.25}
                distance={12}
                ref={lightRef}
            />
            <MapControls makeDefault minPolarAngle={Math.PI / 3.5} maxPolarAngle={Math.PI / 3.5} minAzimuthAngle={Math.PI} maxAzimuthAngle={Math.PI} ref={cameraRef} />
            {children}
        </>
    );
}
