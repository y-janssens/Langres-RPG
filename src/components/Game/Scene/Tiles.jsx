import { useState, useRef, useMemo, memo, useEffect } from 'react';
import { useThree } from '@react-three/fiber';
import { useGameContext } from '../../../hooks';
import { Text } from '@react-three/drei';
import { Tree } from './Tree';
import Water from './Water';

export const Tiles = memo(({ data }) => {
    const { camera } = useThree();
    const { x, z } = camera.position;
    const [context] = useGameContext();
    const [treeColorMap, setTreeColorMap] = useState(() => context.controls.assets.get_trees(data));
    const [grassColorMap] = useState(() => context.controls.assets.get_grass());
    const [waterColorMap] = useState(() => context.controls.assets.get_water());

    useEffect(() => {
        setTreeColorMap(context.controls.assets.get_trees(data));
    }, [data, context.controls.assets]);

    if (!treeColorMap || treeColorMap.length === 0) {
        return null;
    }

    return data.map((item, index) => {
        if (-item.x < x + 11 && -item.x > x - 11 && -item.y < z + 29 && -item.y > z + 11) {
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

    const nearWater = useMemo(() => {
        return data
            .flat()
            .filter((it) => [item.id + 1, item.id - 1, item.id + 50, item.id - 50].includes(it.id))
            .some((it) => it.value === 'W');
    }, [data, item]);

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
