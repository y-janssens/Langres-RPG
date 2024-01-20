import { DoubleSide } from 'three';

export function Tree({ position, colorMap }) {
    return (
        <mesh position={position} rotation={[0, 0, 0]} scale={[3.5, 3.5, 1]}>
            <planeGeometry args={[1, 1, 1]} />
            <meshStandardMaterial side={DoubleSide} map={colorMap} transparent />
        </mesh>
    );
}
