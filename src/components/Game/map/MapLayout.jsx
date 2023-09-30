import { useFrame } from '@react-three/fiber';
import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import useGameContext from '../../../hooks/useGameContext';

export const MapLayout = ({ world, data, position, characterRef, cameraRef, lightRef }) => {
    const [context] = useGameContext();

    useFrame(() => {
        if (cameraRef.current && characterRef.current && lightRef.current) {
            const characterPosition = characterRef.current.position;
            const distance = world.width / 2;

            let x = characterPosition.x - distance;
            let z = -(distance - characterPosition.z) - distance / 1.325;
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
            <Tiles data={data} />
        </group>
    );
};
