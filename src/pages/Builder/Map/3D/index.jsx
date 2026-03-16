import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import { EffectComposer, Pixelation } from '@react-three/postprocessing';

import { Tiles } from './Tiles';

const Scene = ({ form, world, handleSelect }) => {
    return (
        <Canvas
            shadows
            performance={{ min: 0.25 }}
            dpr={[0.5, 1]}
            camera={{
                position: [0, 15, -18.86],
                fov: 25,
                gl: { antialias: false }
            }}
        >
            <color attach="background" args={[0, 0, 0]} />
            <ambientLight intensity={1} />
            <MapControls
                makeDefault
                minPolarAngle={Math.PI / 3.5}
                maxPolarAngle={Math.PI / 3.5}
                minAzimuthAngle={Math.PI}
                maxAzimuthAngle={Math.PI}
                dampingFactor={0.5}
                zoomToCursor={true}
            />
            <EffectComposer disableNormalPass>
                <Pixelation granularity={0} />
                <group position={[form.selectedMap?.size / 2, 0, form.selectedMap?.size / 2]}>
                    <Tiles form={form} data={world?.content} handleSelect={handleSelect} />
                </group>
            </EffectComposer>
        </Canvas>
    );
};

export default Scene;
