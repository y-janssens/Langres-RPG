import { useState, useRef, useEffect, memo, useCallback, useMemo } from 'react';
import { Vector2, BufferAttribute, BufferGeometry, DoubleSide } from 'three';
import { useThree } from '@react-three/fiber';

import { useGameContext } from '../../../hooks';
import { Text } from '@react-three/drei';
import { Tree } from './Tree';
import Water from './Water';

export const Tiles = memo(({ data, characterRef }) => {
    const [context] = useGameContext();
    const { camera } = useThree();
    const [treeColorMap] = useState(() => context.controls.assets.get_trees(data));
    const [grassColorMap] = useState(() => context.controls.assets.get_grass());
    const [waterColorMap] = useState(() => context.controls.assets.get_water());

    const position = useMemo(() => {
        if (!characterRef.current) {
            return { x: context.controls.positions[0], z: context.controls.positions[2] - 18 };
        }
        return { x: camera.position.x, z: camera.position.z };
    }, [camera, context, characterRef]);

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
                    {item.value !== 'W' && (
                        <Tile
                            context={context}
                            data={data}
                            item={item}
                            position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]}
                            colorMap={grassColorMap}
                        />
                    )}
                    {item.value === 'W' && <Water position={[item.y % 2 === 0 ? -item.x : -item.x + 0.5, -0.5, -item.y]} colorMap={waterColorMap} />}
                </group>
            );
        }
    });
});

const Tile = memo(({ context, data, item, position, colorMap }) => {
    const meshRef = useRef();
    const [nearWater, setNearWater] = useState(false);

    // useEffect(() => {
    //     const isNearWater = data.filter((it) => [item.id + 1, item.id - 1, item.id + 50, item.id - 50].includes(it.id)).some((it) => it.value === 'W');
    //     setNearWater(isNearWater);
    // }, []);

    // return (
    //     <mesh castShadow receiveShadow ref={meshRef} position={nearWater ? [position[0], -0.5, position[2]] : position} rotation={[-(Math.PI / 2), 0, 0]} scale={[0.99, 0.99, 1]}>
    //         {nearWater ? <boxGeometry args={[1, 1, 1]} /> : <planeGeometry args={[1, 1, 1]} />}
    //         <meshStandardMaterial color={'white'} map={colorMap} emissive={0xffffff} emissiveIntensity={0.01} />
    //     </mesh>
    // );

    return (
        <>
            {context.devMode && (
                <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                    {item.id}
                </Text>
            )}
            <Hexagon
                position={nearWater ? [position[0], -0.5, position[2]] : position}
                rotation={nearWater ? [-(Math.PI / 2), 0, 0] : [-(Math.PI / 2), 0, -(Math.PI / 2)]}
                scale={[0.77, 0.77, 0.77]}
                colorMap={colorMap}
                meshRef={meshRef}
                item={item}
                name={item.id}
            />
        </>
    );
});

export const Hexagon = memo(({ radius = 1, position, rotation, scale, colorMap = null, meshRef = null, item, name }) => {
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
            <meshStandardMaterial color={'white'} map={colorMap} />
        </mesh>
    );
});
