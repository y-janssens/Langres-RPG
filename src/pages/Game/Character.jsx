import React, { memo } from 'react';

const Character = memo(({ position, characterRef }) => {
    return (
        <mesh ref={characterRef} scale={[0.25, 0.25, 0.25]} rotation={[Math.PI / 2, 0, Math.PI]} position={position} castShadow receiveShadow>
            <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
            <meshStandardMaterial color="yellow" />
        </mesh>
    );
});

export default Character;
