import { useCallback, useRef } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGameContext } from '../../../hooks';
import gsap from 'gsap';
import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import Zombie from '../Ennemies/Zombie';

export const MapLayout = ({ world, data, position, characterRef, cameraRef, lightRef }) => {
    const [context, setContext] = useGameContext();
    const animationQueue = useRef();

    const handleMove = useCallback(
        (targetPosition) => {
            if (animationQueue.current) {
                animationQueue.current.kill();
            }

            animationQueue.current = gsap.to(characterRef.current.position, {
                x: targetPosition.x,
                z: targetPosition.z,
                duration: 0.5,
                lazy: false
            });
            const tile = data.flat()?.find((it) => it.x === Math.abs(targetPosition.x) && it.y === Math.abs(targetPosition.z));

            if (Boolean(tile?.threshold) && Object.keys(tile?.threshold).length) {
                setContext({ mapId: tile.threshold.map })
            }
        },
        [animationQueue, characterRef]
    );

    useFrame(() => {
        if (cameraRef.current && characterRef.current && lightRef.current) {
            const characterPosition = characterRef.current.position;
            const x = characterPosition.x;
            const z = characterPosition.z;

            handleMove({ x: context.controls.positions[0], z: context.controls.positions[2] });

            cameraRef.current.object.position.set(x, 15, z - 18);
            lightRef.current.position.set(x, 10, z);

            switch (context.direction) {
                case 'up':
                    characterRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                    break;
                case 'down':
                    characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                    break;
                case 'left':
                    characterRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                    break;
                case 'right':
                    characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                    break;
                default:
                    break;
            }
        }
    });
    return (
        <>
            <Character position={position} characterRef={characterRef} />
            <Zombies target={characterRef} map={world} nodes={context.grid} />
            <Tiles data={data} />
        </>
    );
};

const Zombies = ({ target, map, nodes }) => {
    const refs = Array.from({ length: 1 }, (_, index) => useRef()); // eslint-disable-line

    return refs.map((ref, index) => {
        return <Zombie key={index} index={index} zombieRef={ref} target={target} map={map} nodes={nodes} />;
    });
};
