import React, { useCallback, useEffect, useRef, useState } from 'react';
import { DoubleSide } from 'three';
import { useLoader } from '@react-three/fiber';
import gsap from 'gsap';
import { TextureLoader } from 'three';
import { NpcBehaviourTree } from '../../models/ia';
import { useGameContext } from '../../hooks';
import { parseCoordinates } from '../../utils';

export const Npcs = ({ npcs, target, map, filteredItems, ready }) => {
    const culledIds = filteredItems.map((i) => i.id);
    // const culledNpcs = npcs.filter(() => culledIds.includes(304)); // Test and debug datas
    const culledNpcs = npcs.filter((npc) => culledIds.includes(npc.starting_point.id));

    if (!ready) {
        return null;
    }
    return culledNpcs.map((npc) => <Npc key={npc.id} npc={npc} target={target} map={map} />);
};

const Npc = ({ npc, target, map }) => {
    const npcRef = useRef();
    const outlineRef = useRef();
    const characterOutlineRef = useRef();
    const [engine] = useGameContext();
    const [ia, setIa] = useState(null);
    const [frameId, setFrameId] = useState();

    const [position] = useState([npc.starting_point.x, 0.75, npc.starting_point.y]);

    const [alpha] = useState(() => useLoader(TextureLoader, './assets/map/outline.jpg'));

    const handleHover = (mode) => {
        const value = mode ? 0.1 : 0;
        const duration = 0.25;

        gsap.to(outlineRef.current, { opacity: value, duration });
        gsap.to(characterOutlineRef.current, { emissiveIntensity: value, duration });
        document.body.style.cursor = mode ? 'pointer' : 'auto';
    };

    const animate = useCallback(() => {
        if (!ia) {
            return;
        }

        ia.update({ target: engine.controls.currentTile });
        gsap.to(npcRef.current.position, {
            ...parseCoordinates(ia.position),
            duration: 1,
            onComplete: () => {
                setFrameId(requestAnimationFrame(animate));
            }
        });
        npcRef.current.rotation.set(ia.direction.x, 0, ia.direction.y);
    }, [ia, npcRef, engine]);

    useEffect(() => {
        if (!ia && npcRef.current) {
            const coordinates = parseCoordinates(position);
            setIa(new NpcBehaviourTree({ target, self: npcRef, map, targetPosition: engine.controls.currentTile, verbose: engine.settings.devMode }));
            npcRef.current.position.set(coordinates.x, 0.75, coordinates.z);
        }
    }, [ia, npcRef, target.current?.position]);

    useEffect(() => {
        animate();

        return () => {
            cancelAnimationFrame(frameId);
        };
    }, [ia]);

    return (
        <group>
            <mesh
                ref={npcRef}
                userData={npc}
                scale={[0.25, 0.25, 0.25]}
                rotation={[Math.PI / 2, 0, Math.PI / 2]}
                position={position}
                castShadow
                receiveShadow
                onPointerEnter={() => handleHover(true)}
                onPointerLeave={() => handleHover(false)}
            >
                <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
                <meshStandardMaterial ref={characterOutlineRef} color="red" emissive={'yellow'} emissiveIntensity={0} />
            </mesh>
            <mesh visible={true} position={[npcRef.current?.position.x, 0, npcRef.current?.position.z]} rotation={[Math.PI / 2, 0, Math.PI]}>
                <planeGeometry attach="geometry" args={[1.2, 1.2]} />
                <meshStandardMaterial ref={outlineRef} color="yellow" transparent side={DoubleSide} emissive={'yellow'} emissiveIntensity={25} alphaMap={alpha} opacity={0} />
            </mesh>
        </group>
    );
};
