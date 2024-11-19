import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';

import { Tiles } from './Tiles';

export const Scene = ({ form, world, handleSelect }) => {
    return (
        <Canvas
            shadows
            camera={{
                position: [0, 15, -18.86],
                fov: 25,
                zoom: 0.5
            }}
        >
            <>
                <ambientLight intensity={5} />
                <MapControls makeDefault />
                <group position={[form.selectedMap?.size / 2, 0, form.selectedMap?.size / 2]}>
                    <Tiles form={form} data={world?.content} handleSelect={handleSelect} />
                </group>
            </>
        </Canvas>
    );
};
