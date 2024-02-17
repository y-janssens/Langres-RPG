import { useState, useRef, memo, useCallback, useMemo } from 'react';
import { Vector2, BufferAttribute, BufferGeometry, DoubleSide } from 'three';
import { useThree } from '@react-three/fiber';

import { useGameContext } from '../../../hooks';
import { Text } from '@react-three/drei';
import { Tree } from './Tree';

export const Tiles = memo(({ data, characterRef }) => {
    const [engine] = useGameContext();
    const { camera } = useThree();
    const [treeColorMap] = useState(() => engine.controls.assets.get_trees(data));
    const [grassColorMap] = useState(() => engine.controls.assets.get_grass());
    const [waterColorMap] = useState(() => engine.controls.assets.get_water());

    const position = useMemo(() => {
        if (!characterRef.current) {
            return { x: engine.controls.positions[0], z: engine.controls.positions[2] - 18 };
        }
        return { x: camera.position.x, z: camera.position.z };
    }, [camera, engine, characterRef]);

    const getFilter = useCallback(
        (item) => {
            return -item.x < position.x + 20 && -item.x > position.x - 20 && -item.y < position.z + 29 && -item.y > position.z + 8;
        },
        [position]
    );

    return [...data].map((item, index) => {
        if (getFilter(item)) {
            return (
                <group key={index}>
                    {(item.value === 'T' || item.value === 'F') && (
                        <Tree
                            key={`${index}_0`}
                            item={item}
                            position={[-item.x / 1.5 + 0.35, 1, item.y === 0 ? -item.y - 0.5 : -item.y * (Math.sqrt(3) / 1.5) - 0.5]}
                            colorMap={treeColorMap.find((it) => it.id === item.id).map}
                        />
                    )}
                    <Tile
                        engine={engine}
                        item={item}
                        position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]}
                        colorMap={item.value === 'W' ? waterColorMap : grassColorMap}
                    />
                </group>
            );
        }
    });
});

const Tile = memo(({ engine, data, item, position, colorMap }) => {
    const meshRef = useRef();

    return (
        <>
            {engine.devMode && (
                <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                    {item.id}
                </Text>
            )}
            <Hexagon
                engine={engine}
                position={position}
                rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}
                scale={[0.77, 0.77, 0.77]}
                colorMap={colorMap}
                meshRef={meshRef}
                item={item}
                name={item.id}
            />
        </>
    );
});

export const Hexagon = memo(({ radius = 1, engine, position, rotation, scale, colorMap = null, meshRef = null, item, name }) => {
    const vertices = useMemo(() => {
        const points = [];
        for (let i = 0; i < 6; i++) {
            const angle = (Math.PI / 3) * i;
            const x = radius * Math.cos(angle);
            const y = radius * Math.sin(angle);
            points.push(new Vector2(x, y));
        }
        return new Float32Array(points.flatMap((p) => [p.x, p.y, 0]));
    }, [radius]);

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
        if (engine) {
            return 'white';
        }
        switch (item.value) {
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
    }, [item, engine]);

    return (
        <mesh
            castShadow
            receiveShadow
            ref={meshRef}
            name={name}
            userData={{ tile: item, castable: item.walkable }}
            geometry={geometry}
            d
            position={position}
            rotation={rotation}
            scale={scale}
            side={DoubleSide}
        >
            <meshStandardMaterial color={color} map={colorMap} />
        </mesh>
    );
});
