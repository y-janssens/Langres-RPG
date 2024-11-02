import { useState, useRef, memo, useMemo } from 'react';
import { Vector2, BufferAttribute, BufferGeometry } from 'three';
import { useGameContext, useSettingsProperties } from '../../../hooks';
import { Tree } from './Tree';
import { Text } from '@react-three/drei';

export const Tiles = memo(({ data }) => {
    const [engine] = useGameContext();
    const [colorMaps] = useState(() => ({
        trees: engine.controls.assets.get_trees(),
        grass: engine.controls.assets.get_grass(),
        water: engine.controls.assets.get_water()
    }));

    const settings = useSettingsProperties({ keys: engine.settings.keys.game }, [engine]);

    return data
        .filter((it) => (settings.displayObstacles ? it : it.walkable))
        .filter((it) => (settings.displayWater ? it : it.value !== 'W'))
        .map((item, index) => (
            <group key={index}>
                {settings.displayMeshes && (item.value === 'T' || item.value === 'F') && (
                    <Tree position={[-item.x / 1.5 + 0.35, 1, item.y === 0 ? -item.y - 0.5 : -item.y * (Math.sqrt(3) / 1.5) - 0.5]} colorMap={colorMaps.trees} />
                )}
                {settings.displayText && item.value !== 'W' && item.Value !== 'S' && (
                    <Text scale={[-0.25, 0.25, 0.25]} position={[-item.x / 1.5, 0.1, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]} color="white">
                        {item.id}
                    </Text>
                )}
                <Hexagon
                    item={item}
                    builder={!settings.displayTextures}
                    position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]}
                    colorMap={settings.displayTextures ? (item.value === 'W' ? colorMaps.water : colorMaps.grass) : null}
                />
            </group>
        ));
});

export const Hexagon = memo(({ position, colorMap, item, builder = false, form = {}, onClick = () => {} }) => {
    const meshRef = useRef();

    const vertices = useMemo(() => {
        const points = [];
        for (let i = 0; i < 6; i++) {
            const angle = (Math.PI / 3) * i;
            const x = Math.cos(angle);
            const y = Math.sin(angle);
            points.push(new Vector2(x, y));
        }
        return new Float32Array(points.flatMap((p) => [p.x, p.y, 0]));
    }, []);

    const uvs = useMemo(() => {
        const vectors = [
            [0.5, 1],
            [1, 0.75],
            [1, 0.25],
            [0.5, 0],
            [0, 0.25],
            [0, 0.75],
            [0.5, 0.5]
        ];
        const uvPoints = vectors.map((vec) => new Vector2(vec[0], vec[1]));
        return new Float32Array(uvPoints.flatMap((p) => [p.x, p.y]));
    }, []);

    const geometry = useMemo(() => {
        const geometry = new BufferGeometry();
        geometry.setAttribute('position', new BufferAttribute(vertices, 3));
        geometry.setAttribute('uv', new BufferAttribute(uvs, 2));
        geometry.setIndex([0, 1, 2, 2, 3, 0, 3, 4, 0, 4, 5, 0]);
        geometry.computeVertexNormals();
        geometry.computeBoundingSphere();
        return geometry;
    }, [vertices, uvs]);

    const color = useMemo(() => {
        if (!builder) {
            return 'white';
        }
        if (!form.showConstraints) {
            switch (item.value) {
                case 'C':
                    return 'lightgreen';
                case 'T':
                    return 'green';
                case 'S':
                    return 'yellow';
                case 'W':
                    return 'blue';
                case '-':
                default:
                    return 'white';
            }
        }
        return item.walkable ? 'white' : '#808080';
    }, [form, item, builder]);

    return (
        <mesh
            castShadow
            receiveShadow
            ref={meshRef}
            geometry={geometry}
            position={position}
            scale={[0.77, 0.77, 0.77]}
            onClick={onClick}
            rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}
            userData={{ tile: item, castable: item.walkable }}
        >
            <meshStandardMaterial color={color} map={colorMap} />
        </mesh>
    );
});
