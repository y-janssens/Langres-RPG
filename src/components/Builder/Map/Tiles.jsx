import { Text } from '@react-three/drei';
import { Hexagon } from '../../Game/Scene/Tiles';

export const Tiles = ({ form, data = [], handleSelect }) => {
    return data.map((item, index) => {
        return <Tile key={index} form={form} item={item} position={[-item.x / 1.5, 0, item.y === 0 ? -item.y : -item.y * (Math.sqrt(3) / 1.5)]} handleSelect={handleSelect} />;
    });
};

function Tile({ form, item, position, handleSelect }) {
    return (
        <>
            <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                {form.showIds && item.id}
                {form.showValues && item.value}
            </Text>

            <Hexagon position={position} onClick={() => handleSelect(item)} item={item} />
        </>
    );
}
