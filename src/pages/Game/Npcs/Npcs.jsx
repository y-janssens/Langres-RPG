import React, { useMemo, memo, useRef } from 'react';

export const Npcs = memo(({ npcs }) => npcs.map((npc) => <Npc key={npc.id} npc={npc} />));

const Npc = memo(({ npc }) => {
    const npcRef = useRef();
    const position = useMemo(() => [-npc.starting_point.x / Math.sqrt(2.24), 0.75, -(npc.starting_point.y + Math.sqrt(3) + 3)]);
    return (
        <mesh
            ref={npcRef}
            scale={[0.25, 0.25, 0.25]}
            rotation={[Math.PI / 2, 0, Math.PI]}
            position={position}
            castShadow
            receiveShadow
            onClick={() => alert(`${npc.first_name} ${npc.last_name}`)}
        >
            <coneGeometry attach="geometry" args={[1, 2.5, 10]} smoothness={5} />
            <meshStandardMaterial color="red" />
        </mesh>
    );
});
