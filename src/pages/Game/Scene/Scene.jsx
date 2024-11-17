import { Canvas } from '@react-three/fiber';

import { MapControls } from '@react-three/drei';
import { Pixelation, EffectComposer } from '@react-three/postprocessing';
import { useGameContext, useSettingsProperties } from '../../../hooks';

const Scene = ({ lightRef, cameraRef, pause, children }) => {
    const [engine] = useGameContext();
    const { pixelization, zoom } = useSettingsProperties({ keys: engine.settings.keys.scene }, [engine]);

    return (
        <Canvas
            shadows
            performance={{ min: 0.25 }}
            frameloop={pause ? 'never' : 'always'}
            dpr={[0.5, 1]}
            camera={{
                fov: 25,
                zoom,
                gl: { antialias: false }
            }}
        >
            <color attach="background" args={[0.5, 0.5, 0.5]} />
            <fogExp2 attach="fog" color="black" density={0.05} />
            <ambientLight intensity={2.5} />
            <pointLight castShadow shadow-mapSize-height={2048} shadow-mapSize-width={2048} intensity={2500} position={[0, 10, 0]} decay={2.25} distance={12} ref={lightRef} />
            <MapControls makeDefault minPolarAngle={Math.PI / 3.5} maxPolarAngle={Math.PI / 3.5} minAzimuthAngle={Math.PI} maxAzimuthAngle={Math.PI} ref={cameraRef} />

            <EffectComposer disableNormalPass>
                <Pixelation granularity={pixelization} />
                {children}
            </EffectComposer>
        </Canvas>
    );
};

export default Scene;
