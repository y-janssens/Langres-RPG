import { Canvas } from "@react-three/fiber";
import { MapControls } from "@react-three/drei";

export const Scene = ({ children, position }) => {
  return (
    <Canvas
      camera={{
        position: [0, 15, -15],
        fov: 25
      }}
    >
      <MapControls makeDefault enableZoom={false} enableRotate={false} />
      <ambientLight intensity={0.5} />
      <directionalLight position={[-100, 100, 100]} intensity={1} />
      {children}
    </Canvas>
  );
};
