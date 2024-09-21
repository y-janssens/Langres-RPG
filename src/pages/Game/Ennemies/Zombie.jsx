import { useEffect, useState } from 'react';
import gsap from 'gsap'; // eslint-disable-line
import { useGameContext } from '../../../hooks';
import NpcBehaviour from '../../../models/ia/tree';
import { parseCoordinates } from '../../../components/utils';

export default function Zombie({ index, target, map, nodes, zombieRef }) { // eslint-disable-line
    const [engine, setEngine] = useGameContext(); // eslint-disable-line
    const [ia, setIa] = useState(null);
    const [position] = useState([9, 0.75, 6]);

    useEffect(() => {
        if (!ia && zombieRef.current) {
            setIa(new NpcBehaviour({ type: 'zombie', target, self: zombieRef, map: { ...map }, nodes, targetPosition: engine.controls.currentTile, verbose: engine.devMode }));
        }
        if (ia) {
            const interval = setInterval(
                () => {
                    ia.update({ target: engine.controls.currentTile });
                    gsap.to(zombieRef.current.position, {
                        ...parseCoordinates(ia.position),
                        duration: 0.5
                    });
                    // switch (ia.direction) {
                    //     case 'up':
                    //         zombieRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                    //         break;
                    //     case 'down':
                    //         zombieRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                    //         break;
                    //     case 'left':
                    //         zombieRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                    //         break;
                    //     case 'right':
                    //         zombieRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                    //         break;
                    // }
                    // setEngine({ [`zombie_${index}`]: { x: ia.position.x, z: ia.position.y } });
                },
                ia.acknowledged ? 100 : 500
            );

            return () => {
                clearInterval(interval);
            };
        }
    }, [ia, zombieRef, target.current?.position]);

    return (
        <mesh ref={zombieRef} scale={[0.25, 0.25, 0.25]} rotation={[Math.PI / 2, 0, Math.PI]} position={position} castShadow receiveShadow>
            <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
            <meshStandardMaterial color={'red'} />
        </mesh>
    );
}
