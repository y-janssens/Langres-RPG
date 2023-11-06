import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import { Pixelation, EffectComposer } from '@react-three/postprocessing';

const Scene = ({ context, lightRef, cameraRef, pause, children }) => {
    if (!context.display3d) {
        return null;
    }
    return (
        <Canvas
            shadows
            frameloop={pause ? 'never' : 'always'}
            dpr={[1, 2]}
            camera={{
                position: [0, 15, -18.86],
                fov: 25,
                zoom: 1.25
            }}
        >
            <color attach="background" args={[0, 0, 0]} />
            <fogExp2 attach="fog" color="black" density={0.05} />
            <ambientLight intensity={2.5} />
            <pointLight
                castShadow
                shadow-mapSize-height={2048}
                shadow-mapSize-width={2048}
                shadow-radius={10}
                shadow-bias={-0.01}
                intensity={2500}
                position={[0, 10, 0]}
                decay={2.25}
                distance={12}
                ref={lightRef}
            />
            <MapControls makeDefault minPolarAngle={Math.PI / 3.5} maxPolarAngle={Math.PI / 3.5} minAzimuthAngle={Math.PI} maxAzimuthAngle={Math.PI} ref={cameraRef} />
            <EffectComposer disableNormalPass>
                <Pixelation granularity={6} />
                {children}
            </EffectComposer>
        </Canvas>
    );
};

export default Scene;
