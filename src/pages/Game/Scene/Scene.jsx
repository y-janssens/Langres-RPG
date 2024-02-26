import { Canvas } from '@react-three/fiber';

import { MapControls, Sky } from '@react-three/drei';
import { Pixelation, EffectComposer } from '@react-three/postprocessing';
import WaterPlane from './Water';

const Scene = ({ lightRef, cameraRef, pause, children }) => {
    return (
        <Canvas
            shadows
            performance={{ min: 0.25 }}
            frameloop={pause ? 'never' : 'always'}
            dpr={[0.5, 1]}
            camera={{
                fov: 25,
                zoom: 1.25,
                gl: { antialias: false }
            }}
        >
            <color attach="background" args={[0, 0, 0]} />
            <fogExp2 attach="fog" color="black" density={0.05} />
            <ambientLight intensity={2.5} />
            <pointLight castShadow shadow-mapSize-height={2048} shadow-mapSize-width={2048} intensity={2500} position={[0, 10, 0]} decay={2.25} distance={12} ref={lightRef} />
            <MapControls makeDefault minPolarAngle={Math.PI / 3.5} maxPolarAngle={Math.PI / 3.5} minAzimuthAngle={Math.PI} maxAzimuthAngle={Math.PI} ref={cameraRef} />

            <EffectComposer disableNormalPass>
                <Pixelation granularity={2.5} />
                <Sky scale={1000} sunPosition={[0, 500, 0]} turbidity={0.1} />
                <WaterPlane />
                {children}
            </EffectComposer>
        </Canvas>
    );
};

export default Scene;
