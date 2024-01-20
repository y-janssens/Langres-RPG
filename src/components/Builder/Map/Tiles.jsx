import { Text } from '@react-three/drei';
import { Hexagon } from '../../Game/Scene/Tiles';

export const Tiles = ({ form, data = [], handleSelect }) => {
    return data.map((item, index) => {
        return (
            <Tile key={index} form={form} data={data} item={item} position={[-item.x / 2, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 2)]} handleSelect={handleSelect} />
        );
    });
};

function Tile({ form, item, position, handleSelect }) {
    return (
        <>
            <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                {form.showIds && item.id}
                {form.showValues && item.value}
            </Text>

            <Hexagon
                position={[position[0], position[1], position[2]]}
                rotation={[-(Math.PI / 2), 0, -(Math.PI / 2)]}
                scale={[0.56, 0.56, 0.56]}
                onClick={() => handleSelect(item)}
                item={item}
                name={item.id}
            />
        </>
    );
}
