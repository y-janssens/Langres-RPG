import { memo, useMemo, useState } from 'react';

import { EdgesGeometry, TextureLoader } from 'three';
import { useLoader } from '@react-three/fiber';

import { createHexagonGeometry } from '../../../../utils';

export const Hexagon = memo(({ position, item, grayscale = false, form = {}, onClick = () => {} }) => {
    const geometry = useMemo(() => createHexagonGeometry(), []);
    const edges = useMemo(() => new EdgesGeometry(geometry, 1), [geometry]);
    const texture = useLoader(TextureLoader, item.texture ?? '/assets/map/grass/grass-1.jpg');

    const [hover, setHover] = useState(false);

    const selected = useMemo(() => form.selectedTiles.includes(item), [form, item]);

    const color = useMemo(() => {
        if (!form.showConstraints) {
            return 'white';
        }

        switch (item.value) {
            case 'C':
                return grayscale ? '#B7B7B7' : 'lightgreen';
            case 'T':
                return grayscale ? '#555555' : 'green';
            case 'S':
                return grayscale ? '#AAAAAA' : 'yellow';
            case 'W':
                return grayscale ? '#555555' : 'blue';
            case '-':
            default:
                return grayscale ? '#FFFFFF' : 'white';
        }
    }, [form, item, grayscale]);

    return (
        <>
            <mesh
                geometry={geometry}
                onPointerEnter={() => setHover(true)}
                onPointerLeave={() => setHover(false)}
                position={position}
                scale={0.77}
                onClick={() => onClick(item)}
                rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}
            >
                <meshStandardMaterial color={color} map={texture} />
            </mesh>
            {(selected || hover) && (
                <group>
                    <lineSegments geometry={edges} position={position} scale={0.77} rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}>
                        <lineBasicMaterial color="#1f83b2" transparent depthTest={false} />
                    </lineSegments>
                    <mesh geometry={geometry} scale={0.78} position={position} rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}>
                        <meshStandardMaterial color="#1f83b2" transparent opacity={0.1} emissive="#1f83b2" emissiveIntensity={2} depthTest={false} />
                    </mesh>
                </group>
            )}
        </>
    );
});
