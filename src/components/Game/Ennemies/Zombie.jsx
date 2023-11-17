import { useEffect, useState } from 'react';
import gsap from 'gsap';
import { useGameContext } from '../../../hooks';
import IA from '../../../models/ia/iaModel';

export default function Zombie({ index, target, map, nodes, zombieRef }) {
    const [context, setContext] = useGameContext();
    const [ia, setIa] = useState(null);
    const [position] = useState([20, 0.5, 25]);

    const targetPosition = { ...target.current?.position };

    useEffect(() => {
        if (!ia && zombieRef.current) {
            setIa(new IA({ type: 'zombie', target, self: zombieRef, map, nodes, allowedKeys: context.controls.validKeys }));
        }
        if (ia) {
            const interval = setInterval(
                () => {
                    ia.update(targetPosition);
                    ia.patrol();
                    gsap.to(zombieRef.current.position, { x: ia.position.x, z: ia.position.y, duration: 0.5 });
                    switch (ia.direction) {
                        case 'up':
                            zombieRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                            break;
                        case 'down':
                            zombieRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                            break;
                        case 'left':
                            zombieRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                            break;
                        case 'right':
                            zombieRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                            break;
                    }
                    setContext({ [`zombie_${index}`]: { x: ia.position.x, z: ia.position.y } });
                },
                ia.acknowledged ? 100 : 500
            );

            return () => {
                clearInterval(interval);
            };
        }
    }, [ia, zombieRef, targetPosition]);

    return (
        <mesh ref={zombieRef} scale={[0.25, 0.25, 0.25]} rotation={[Math.PI / 2, 0, Math.PI]} position={position} castShadow receiveShadow>
            <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
            <meshStandardMaterial color={'red'} />
        </mesh>
    );
}
