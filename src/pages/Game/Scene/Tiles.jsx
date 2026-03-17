import { useState, useRef, memo, useMemo } from 'react';

import { useGameContext, useSettingsProperties } from '../../../hooks';

import { Tree } from './Tree';
import { Text } from '@react-three/drei';

import { createHexagonGeometry } from '../../../utils';

export const Tiles = memo(({ data }) => {
    const [engine] = useGameContext();
    const [colorMaps] = useState(() => ({
        trees: engine.controls.assets.get_trees(),
        grass: engine.controls.assets.get_grass(),
        water: engine.controls.assets.get_water()
    }));

    const settings = useSettingsProperties({ keys: engine.settings.keys.game }, [engine]);
    const { performances } = useSettingsProperties({ keys: 'performances' }, [engine]);

    const filteredData = useMemo(() => {
        return data.filter((it) => (settings.displayObstacles ? it : it.walkable)).filter((it) => (settings.displayWater ? it : it.value !== 'W'));
    }, [data, settings.displayObstacles, settings.displayWater]);

    return filteredData.map((item) => (
        <group key={item.id}>
            {settings.displayMeshes && (item.value === 'T' || item.value === 'F') && (
                <Tree position={[-item.x / 1.5 + 0.35, 1, item.y === 0 ? -item.y - 0.5 : -item.y * (Math.sqrt(3) / 1.5) - 0.5]} colorMap={colorMaps.trees} />
            )}
            {settings.displayText && item.value !== 'W' && item.value !== 'S' && (
                <Text scale={[-0.25, 0.25, 0.25]} position={[-item.x / 1.5, 0.1, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]} color="white">
                    {item.id}
                </Text>
            )}
            <Hexagon
                item={item}
                grayscale={performances}
                position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]}
                colorMap={settings.displayTextures ? (item.value === 'W' ? colorMaps.water : colorMaps.grass) : null}
            />
        </group>
    ));
});

export const Hexagon = memo(({ position, colorMap, item, onClick = () => {} }) => {
    const meshRef = useRef();

    const geometry = useMemo(() => createHexagonGeometry(), []);

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
            <meshStandardMaterial color={'white'} map={colorMap} />
        </mesh>
    );
});
