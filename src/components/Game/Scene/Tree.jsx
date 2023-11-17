import { useRef } from 'react';
import { DoubleSide } from 'three';

export function Tree({ position, colorMap }) {
    const treeRef = useRef();
    // return null;

    return (
        <mesh position={position} rotation={[0, 0, 0]} scale={[3, 3, 1]} ref={treeRef}>
            <planeGeometry args={[1, 1, 1]} />
            <meshStandardMaterial side={DoubleSide} map={colorMap} transparent />
        </mesh>
    );
}
