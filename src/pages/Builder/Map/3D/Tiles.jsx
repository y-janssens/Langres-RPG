import { memo } from 'react';

import { Text } from '@react-three/drei';

import { Hexagon } from './Hexagon';
import { Tree } from './Tree';

export const Tiles = memo(({ form, data = [], handleSelect }) => {
    return data.map((item) => {
        return <Tile key={item.id} form={form} item={item} position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]} handleSelect={handleSelect} />;
    });
});

const Tile = memo(({ form, item, position, handleSelect }) => {
    return (
        <group>
            <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.2, position[2]]} color="white">
                {form.showIds && item.id}
                {form.showValues && item.value}
            </Text>

            {form.showObjects && (item.value === 'T' || item.value === 'F') && <Tree position={[position[0] + 0.35, 1, position[2] - 0.5]} />}

            <Hexagon position={position} onClick={handleSelect} item={item} builder form={form} />
        </group>
    );
});
