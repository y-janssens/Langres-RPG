import { useState, useRef, useEffect, memo, useCallback, useMemo } from 'react';
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
            return -item.x < position.x + 10 && -item.x > position.x - 10 && -item.y < position.z + 29 && -item.y > position.z + 10;
        },
        [position]
    );

    return [...data].map((item, index) => {
        if (getFilter(item)) {
            return (
                <group key={index}>
                    {(item.value === 'T' || item.value === 'F') && (
                        <Tree item={item} position={[-item.x + 0.5, 1, -item.y - 0.5]} colorMap={treeColorMap.find((it) => it.id === item.id).map} />
                    )}
                    {item.value !== 'W' && <Tile context={context} data={data} item={item} position={[-item.x, 0, -item.y]} colorMap={grassColorMap} />}
                    {item.value === 'W' && <Water position={[-item.x, -0.5, -item.y]} colorMap={waterColorMap} />}
                </group>
            );
        }
    });
});

const Tile = memo(({ context, data, item, position, colorMap }) => {
    const meshRef = useRef();
    const [nearWater, setNearWater] = useState(false);

    useEffect(() => {
        const isNearWater = data.filter((it) => [item.id + 1, item.id - 1, item.id + 50, item.id - 50].includes(it.id)).some((it) => it.value === 'W');
        setNearWater(isNearWater);
    }, []);

    return (
        <>
            {context.devMode && (
                <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                    {item.id}
                </Text>
            )}
            <mesh
                castShadow
                receiveShadow
                ref={meshRef}
                position={nearWater ? [position[0], -0.5, position[2]] : position}
                rotation={[-(Math.PI / 2), 0, 0]}
                scale={[0.99, 0.99, 1]}
            >
                {nearWater ? <boxGeometry args={[1, 1, 1]} /> : <planeGeometry args={[1, 1, 1]} />}
                <meshStandardMaterial color={'white'} map={colorMap} emissive={0xffffff} emissiveIntensity={0.01} />
            </mesh>
        </>
    );
});
