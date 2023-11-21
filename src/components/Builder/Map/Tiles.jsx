import { useRef } from 'react';
import { Text } from '@react-three/drei';

export const Tiles = ({ form, data, handleSelect }) => {
    return data.map((row) =>
        row.map((item, index) => {
            return (
                <group key={index}>
                    <Tile form={form} data={data} item={item} position={[-item.x, 0, -item.y]} handleSelect={handleSelect} />
                </group>
            );
        })
    );
};

function Tile({ form, item, position, handleSelect }) {
    const meshRef = useRef();

    return (
        <>
            <Text scale={[-0.25, 0.25, 0.25]} position={[position[0], position[1] + 0.1, position[2]]} color="white">
                {form.showIds && item.id}
                {form.showValues && item.value}
            </Text>

            <mesh castShadow receiveShadow ref={meshRef} position={position} rotation={[-(Math.PI / 2), 0, 0]} scale={[0.99, 0.99, 1]} onClick={() => handleSelect(item)}>
                <planeGeometry args={[1, 1, 1]} />
                <meshStandardMaterial color={'#353535'} />
            </mesh>
        </>
    );
}
