import { useFrame } from '@react-three/fiber';
import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import Zombie from '../Ennemies/Zombie';
import useGameContext from '../../../hooks/useGameContext';
import { useRef } from 'react';
import gsap from 'gsap';

export const MapLayout = ({ world, data, position, characterRef, cameraRef, lightRef }) => {
    const [context] = useGameContext();

    useFrame(() => {
        if (cameraRef.current && characterRef.current && lightRef.current) {
            const characterPosition = characterRef.current.position;
            const distance = world.width / 2;

            let x = characterPosition.x - distance;
            let z = -(distance - characterPosition.z) - distance / 1.325;

            // if (context.direction === context.previousDirection) {
            gsap.to(characterRef.current.position, { x: context.controls.positions[0], z: context.controls.positions[2], duration: 0.5 });
            // }

            cameraRef.current.object.position.set(x, 15, z);
            lightRef.current.position.set(x, 10, -(distance - characterPosition.z));

            if (context.direction && !context.controls.toggles.input) {
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
                }
            }
        }
    });

    return (
        <group position={[-world.width / 2, 0, -world.width / 2]}>
            <Character position={position} characterRef={characterRef} />
            <Zombies target={characterRef} map={world} nodes={context.grid} />
            <Tiles data={data} />
        </group>
    );
};

const Zombies = ({ target, map, nodes }) => {
    const refs = Array.from({ length: 1 }, (_, index) => useRef()); // eslint-disable-line

    return refs.map((ref, index) => {
        return <Zombie key={index} index={index} zombieRef={ref} target={target} map={map} nodes={nodes} />;
    });
};
