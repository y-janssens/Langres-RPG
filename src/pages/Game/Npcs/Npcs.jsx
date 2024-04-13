import React, { useMemo, memo, useRef, useState } from 'react';
import { DoubleSide } from 'three';
import { useLoader } from '@react-three/fiber';
import gsap from 'gsap';
import { TextureLoader } from 'three';

export const Npcs = memo(({ npcs }) => npcs.map((npc) => <Npc key={npc.id} npc={npc} />));

const Npc = memo(({ npc }) => {
    const npcRef = useRef();
    const outlineRef = useRef();
    const characterOutlineRef = useRef();
    const position = useMemo(() => [-npc.starting_point.x / Math.sqrt(2.24), 0.75, -(npc.starting_point.y + Math.sqrt(3) + 3)]);
    const [alpha] = useState(() => useLoader(TextureLoader, './assets/map/outline.jpg'));

    const handleHover = (mode) => {
        const value = mode ? 0.1 : 0;
        const duration = 0.25;

        gsap.to(outlineRef.current, { opacity: value, duration });
        gsap.to(characterOutlineRef.current, { emissiveIntensity: value, duration });
        document.body.style.cursor = mode ? 'pointer' : 'auto';
    };

    return (
        <group>
            <mesh
                ref={npcRef}
                scale={[0.25, 0.25, 0.25]}
                rotation={[Math.PI / 2, 0, Math.PI]}
                position={position}
                castShadow
                receiveShadow
                onPointerEnter={() => handleHover(true)}
                onPointerLeave={() => handleHover(false)}
            >
                <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
                <meshStandardMaterial ref={characterOutlineRef} color="red" emissive={'yellow'} emissiveIntensity={0} />
            </mesh>
            <mesh visible={true} position={[position[0], 0, position[2]]} rotation={[Math.PI / 2, 0, Math.PI]}>
                <planeGeometry attach="geometry" args={[1.2, 1.2]} />
                <meshStandardMaterial ref={outlineRef} color="yellow" transparent side={DoubleSide} emissive={'yellow'} emissiveIntensity={25} alphaMap={alpha} opacity={0} />
            </mesh>
        </group>
    );
});
