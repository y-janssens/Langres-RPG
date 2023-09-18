import { useState, useRef, useMemo } from 'react';
import useGameContext from '../../../hooks/useGameContext';
import { Tree } from './Tree';
import Water from './Water';

export const Tiles = ({ data }) => {
    const [context] = useGameContext();
    const [treeColorMap] = useState(() => context.assets.get_trees(data));
    const [grassColorMap] = useState(() => context.assets.get_grass());
    const [waterColorMap] = useState(() => context.assets.get_water());

    return data.map((row) =>
        row.map((item, index) => {
            return (
                <group key={index}>
                    {(item.value === 'T' || item.value === 'F') && (
                        <Tree item={item} position={[item.x + 0.5, 1, item.y - 0.5]} colorMap={treeColorMap.find((it) => it.id === item.id).map} />
                    )}
                    {item.value !== 'W' && <Tile data={data} item={item} position={[item.x, 0, item.y]} colorMap={grassColorMap} />}
                    {item.value === 'W' && <Water position={[item.x, -0.5, item.y]} colorMap={waterColorMap} />}
                </group>
            );
        })
    );
};

function Tile({ data, item, position, colorMap }) {
    const meshRef = useRef();

    const nearWater = useMemo(() => {
        return data
            .flat()
            .filter((it) => [item.id + 1, item.id - 1, item.id + 50, item.id - 50].includes(it.id))
            .some((it) => it.value === 'W');
    }, [data, item]);

    return (
        <mesh castShadow receiveShadow ref={meshRef} position={nearWater ? [position[0], -0.5, position[2]] : position} rotation={[-(Math.PI / 2), 0, 0]} scale={[0.99, 0.99, 1]}>
            {nearWater ? <boxGeometry args={[1, 1, 1]} /> : <planeGeometry args={[1, 1, 1]} />}
            <meshStandardMaterial color={'white'} map={colorMap} emissive={0xffffff} emissiveIntensity={0.01} />
        </mesh>
    );
}
