import { useRef, memo, useEffect, useState, useCallback, useMemo } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGameContext } from '../../../hooks';
import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import Zombie from '../Ennemies/Zombie';

import { Raycaster, Vector3 } from 'three';

const positionCaster = new Raycaster();
const collisionCaster = new Raycaster();

export const MapLayout = memo(({ form, position, characterRef, cameraRef, lightRef, handleGateWay }) => {
    const [context, setContext] = useGameContext();
    const [isInitialized, setIsInitialized] = useState(false);
    const [focus] = useState(() => new Vector3(0, -1, 1));

    const directions = useMemo(() => context.controls.directions, [context]);

    const computePositions = useCallback(() => {
        const character = characterRef.current.position;
        cameraRef.current.object.position.set(Math.max(-44, Math.min(-4.5, character.x)), 15, Math.max(-62, Math.min(-25, character.z - 18)));
        lightRef.current.position.set(character.x, 10, character.z);
        context.controls.setPosition({ x: character.x, z: character.z });

        if (context.controls.getDelta(character)) {
            context.controls.setCamera(character);
            setContext({ controls: context.controls });
        }
    }, [cameraRef, lightRef, context, characterRef]);

    useFrame(({ scene }) => {
        if (isInitialized) {
            const character = characterRef.current.position;

            if (context.controls.moving) {
                positionCaster.set(character, new Vector3(0, -1, 0).normalize());
                collisionCaster.set(character, focus);

                const tiles = context.controls.rayCasterResolver({
                    positionCaster,
                    collisionCaster,
                    scene
                });

                switch (true) {
                    case directions.up:
                        focus.set(0, -1, 1);
                        if (tiles.canMove) {
                            character.z += 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                        break;

                    case directions.down:
                        focus.set(0, -1, -1);
                        if (tiles.canMove) {
                            character.z -= 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                        break;

                    case directions.left:
                        focus.set(1, -1, 0);
                        if (tiles.canMove) {
                            character.x += 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                        break;

                    case directions.right:
                        focus.set(-1, -1, 0);
                        if (tiles.canMove) {
                            character.x -= 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                        break;
                }

                if (Boolean(tiles.current?.threshold) && Object.keys(tiles.current?.threshold).length) {
                    handleGateWay(tiles.current?.threshold);
                }
            }
            computePositions();
        }
    });

    useEffect(() => {
        if (cameraRef.current && characterRef && lightRef.current && !isInitialized) {
            setIsInitialized(true);
        }
    }, [isInitialized]);

    return (
        <>
            <Character position={position} characterRef={characterRef} />
            {/* <Zombies target={characterRef} map={form.world} nodes={form.world.grid} /> */}
            <Tiles data={form.world.content} form={form} characterRef={characterRef} cameraRef={cameraRef} />
        </>
    );
});

const Zombies = ({ target, map, nodes }) => {
    const refs = Array.from({ length: 1 }, (_, index) => useRef()); // eslint-disable-line

    return refs.map((ref, index) => {
        return <Zombie key={index} index={index} zombieRef={ref} target={target} map={map} nodes={nodes} />;
    });
};
