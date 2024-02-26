import { memo, useState, useCallback, useEffect } from 'react';
import { Raycaster, Vector3 } from 'three';
import { useFrame } from '@react-three/fiber';

import { useGameContext } from '../../../hooks';

import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import Zombie from '../Ennemies/Zombie'; // eslint-disable-line

const positionCaster = new Raycaster();
const collisionCaster = new Raycaster();

export const MapLayout = memo(({ position, characterRef, cameraRef, lightRef, handleGateWay }) => {
    const [engine] = useGameContext();
    const [focus] = useState(() => new Vector3(0, -1, 1));
    const [filteredItems, setFilteredItems] = useState(() => engine.controls.filterItems());

    const frustumCullItems = useCallback(() => {
        setFilteredItems(engine.controls.filterItems());
    }, [engine]);

    const computePositions = useCallback(() => {
        const character = characterRef.current.position;
        cameraRef.current.object.position.set(
            Math.max(-58, Math.min(-4.5, character.x)),
            15,
            Math.max(-79, Math.min(-25, character.z - 18)));
        lightRef.current.position.set(character.x, 10, character.z);

        if (engine.controls.getDelta(character)) {
            engine.controls.setPosition({ x: character.x, z: character.z });
            engine.controls.setCamera(character);
        }
    }, [cameraRef, lightRef, engine, characterRef]);

    useFrame(({ scene }) => {
        if (cameraRef.current && characterRef && lightRef.current) {
            const character = characterRef.current.position;

            if (engine.controls.isMoving) {
                positionCaster.set(character, new Vector3(0, -1, 0).normalize());
                collisionCaster.set(character, focus);

                const tiles = engine.controls.rayCasterResolver({
                    positionCaster,
                    collisionCaster,
                    scene
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

                if (Boolean(tiles.current?.threshold) && Object.keys(tiles.current?.threshold).length) {
                    handleGateWay(tiles.current?.threshold);
                }

                if (engine.controls.getDelta(character)) {
                    frustumCullItems();
                }
            }
            computePositions();
        }
    });

    useEffect(() => {
        frustumCullItems();
    }, []);

    return (
        <>
            <Character position={position} characterRef={characterRef} />
            {/* <Zombies target={characterRef} map={form.world} nodes={form.world.grid} /> */}
            <Tiles data={filteredItems} />
        </>
    );
});

// const Zombies = ({ target, map, nodes }) => { // eslint-disable-line
//     const refs = Array.from({ length: 1 }, (_, index) => useRef()); // eslint-disable-line

//     return refs.map((ref, index) => {
//         return <Zombie key={index} index={index} zombieRef={ref} target={target} map={map} nodes={nodes} />;
//     });
// };
