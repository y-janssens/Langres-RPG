import { useLoader } from '@react-three/fiber';
import { memo } from 'react';
import { DoubleSide, TextureLoader } from 'three';

export const Tree = memo(({ position }) => {
    const colorMap = useLoader(TextureLoader, '/assets/map/trees/1.png');
    return (
        <mesh position={position} rotation={[0, 0, 0]} scale={[3.5, 3.5, 1]}>
            <planeGeometry args={[1, 1, 1]} />
            <meshStandardMaterial side={DoubleSide} map={colorMap} transparent />
        </mesh>
    );
});
