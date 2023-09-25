import { useEffect, useState, useRef, useMemo } from 'react';
import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import { useGet } from '../../hooks/useGet';
import { GameModel, World } from '../../models';
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
    const [loading, setLoading] = useState(false);

    const cameraRef = useRef();
    const characterRef = useRef();
    const pointLightRef = useRef();

    const id = useMemo(() => {
        if (!Object.keys(context).length || !('gameId' in context)) {
            return null;
        }
        return context.gameId;
    }, [context]);

    const [form, , setFormObject] = useForm({
        id: null
    });

    useGet(
        {
            func: 'load_game',
            id: parseInt(id),
            launch: id,
            onSuccess: (response) => {
                setFormObject(response);
                setContext({ gameId: parseInt(id) });
            }
        },
        [id]
    );

    const contextReady = useMemo(() => {
        if (!context) {
            return false;
        }
        const expectedKeys = ['assets', 'controls', 'gameId', 'world', 'map', 'applicationData'];
        return Boolean(expectedKeys.every((key) => Object.prototype.hasOwnProperty.call(context, key)));
    }, [context]);

    useEffect(() => {
        if (id && form.id) {
            setLoading(true);
            let game = new GameModel(form);
            let world = new World(form.world);
            let _world = world.parse();
            setGameMap(_world);
            setContext({ game, world, map: _world });
            // setPosition(() => controls.pick_starting_point(world));

            if (form.save_count < 1) {
                game.save();
            }
            setLoading(false);
        }
    }, [id, form]);

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        game.current.focus();
    }, [context]);

    if (!id) {
        return null;
    }

    return (
        <>
            <InGameMenu id={id} game={game} />
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
                        <color attach="background" args={[0, 0, 0]} />
                        <fogExp2 attach="fog" color="black" density={0.05} />
                        {/* <fog attach="fog" color="black" near={1} far={40} /> */}
                        <MapControls makeDefault minPolarAngle={Math.PI / 3.5} maxPolarAngle={Math.PI / 3.5} minAzimuthAngle={Math.PI} maxAzimuthAngle={Math.PI} ref={cameraRef} />
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
                            ref={pointLightRef}
                        />

                        {/* <directionalLight position={[-100, 100, 100]} intensity={0.25} /> */}
                        <MapLayout world={form.world} data={gameMap} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} />
                    </Canvas>
                )}
            </LoadingScreen>
        </>
    );
};
