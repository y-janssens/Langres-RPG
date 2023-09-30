import { useCallback, useEffect, useMemo, useState } from 'react';
import IA from '../../../models/ia/iaModel';

export default function Zombie({ context, target, map, zombieRef }) {
    const [ia, setIa] = useState(null);
    const [position, setPosition] = useState([20, 0.5, 25]);

    const targetPosition = { ...target.current?.position };

    useEffect(() => {
        if (!ia && zombieRef.current) {
            setIa(new IA({ type: 'zombie', target, self: zombieRef, map, allowedKeys: context.controls.validKeys }));
        }
        if (ia) {
            const interval = setInterval(() => {
                ia.update(targetPosition);
                if (ia.patrolling) {
                    ia.patrol();
                    setPosition([ia.position.x, position[1], ia.position.y]);
                }
                if (ia.acknowledge) {
                    ia.find_path();
                    setPosition([ia.position.x, position[1], ia.position.y]);
                }
            }, 1000);

            return () => {
                clearInterval(interval);
            };
        }
    }, [ia, zombieRef, targetPosition]);

    return (
        <mesh ref={zombieRef} scale={[0.25, 0.25, 0.25]} rotation={[Math.PI / 2, 0, Math.PI]} position={position} castShadow receiveShadow>
            <boxGeometry attach="geometry" args={[2.5, 2.5, 2.5]} smoothness={5} />
            <meshStandardMaterial color={'red'} />
        </mesh>
    );
}
