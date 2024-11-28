import { memo, useState, useCallback, useEffect } from 'react';
import { Raycaster, Vector3 } from 'three';
import { useFrame } from '@react-three/fiber';

import { useGameContext, useSettingsProperties } from '../../hooks';

import { Tiles } from './Scene';
import Character from './Character';
import { Npcs } from './Npcs';

const positionCaster = new Raycaster();
const collisionCaster = new Raycaster();

export const MapLayout = memo(({ form, position, characterRef, cameraRef, lightRef, handleGateWay }) => {
    const [engine] = useGameContext();
    const [ready, setReady] = useState(false);
    const [focus] = useState(() => new Vector3(0, -1, 1));
    const [filteredItems, setFilteredItems] = useState(() => engine.controls.items);
    const { collisions: computeCollisions } = useSettingsProperties({ keys: 'collisions' }, [engine]);

    const frustumCullItems = useCallback(() => {
        setFilteredItems(engine.controls.filterItems());
    }, [engine]);

    const computePositions = useCallback(() => {
        const character = characterRef.current.position;
        cameraRef.current.object.position.set(Math.max(-58, Math.min(-4.5, character.x)), 15, Math.max(-79, Math.min(-25, character.z - 18)));
        lightRef.current.position.set(character.x, 10, character.z);

        if (engine.controls.getDelta(character)) {
            engine.controls.setPosition({ x: character.x, z: character.z });
            engine.controls.setCamera(character);
        }
    }, [cameraRef, lightRef, engine, characterRef]);

    const computeMovements = useCallback(
        (scene) => {
            if (cameraRef.current && characterRef && lightRef.current) {
                const character = characterRef.current.position;

                if (engine.controls.isMoving) {
                    positionCaster.set(character, new Vector3(0, -1, 0).normalize());
                    collisionCaster.set(character, focus);

                    const tiles = engine.controls.rayCasterResolver({
                        positionCaster,
                        collisionCaster,
                        scene,
                        computeCollisions
                    });

                    switch (true) {
                        case engine.controls.directions.up:
                            focus.set(0, -1, 1);
                            if (tiles.canMove) {
                                character.z += 0.015 * engine.controls.speed;
                            }
                            characterRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                            break;

                        case engine.controls.directions.down:
                            focus.set(0, -1, -1);
                            if (tiles.canMove) {
                                character.z -= 0.015 * engine.controls.speed;
                            }
                            characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                            break;

                        case engine.controls.directions.left:
                            focus.set(1, -1, 0);
                            if (tiles.canMove) {
                                character.x += 0.015 * engine.controls.speed;
                            }
                            characterRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                            break;

                        case engine.controls.directions.right:
                            focus.set(-1, -1, 0);
                            if (tiles.canMove) {
                                character.x -= 0.015 * engine.controls.speed;
                            }
                            characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                            break;
                    }

                    if (tiles.current?.events.length) {
                        if (tiles.current?.hasGateway) {
                            handleGateWay(tiles.current?.gateway);
                        }
                    }

                    if (engine.controls.getDelta(character)) {
                        frustumCullItems();
                    }
                }
                computePositions();
            }
        },
        [engine, characterRef, computePositions, frustumCullItems, handleGateWay, focus, positionCaster, collisionCaster, computeCollisions]
    );

    useFrame(({ scene }) => {
        computeMovements(scene);
    });

    useEffect(() => {
        frustumCullItems();
        setReady(true);
    }, [engine.mapId]);

    return (
        <>
            <Character position={position} characterRef={characterRef} />
            <Npcs npcs={form.world.npcs} target={characterRef} map={form.world} filteredItems={filteredItems} ready={ready} />
            <Tiles data={filteredItems} />
        </>
    );
});
