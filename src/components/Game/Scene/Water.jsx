import { useRef } from 'react';
import { DoubleSide } from 'three';

function Water({ position, colorMap }) {
    const meshRef = useRef();

    return (
        <>
            <mesh ref={meshRef} position={position} rotation={[Math.PI / 2, 0, 0]} scale={[1, 1, 1]}>
                <planeGeometry args={[1, 1, 1]} />
                <meshStandardMaterial color={'white'} side={DoubleSide} map={colorMap} emissive={0xffffff} emissiveIntensity={0.01} />
            </mesh>
        </>
    );
}

export default Water;
