import useGameContext from "../../../hooks/useGameContext";
import { useRef } from "react";
import { DoubleSide } from "three";

export function Tree({ position, colorMap }) {
  const treeRef = useRef();

  return (
    <mesh
      position={position}
      rotation={[0, 0, 0]}
      scale={[2, 2, 1]}
      ref={treeRef}
    >
      <planeGeometry args={[1, 1, 1]} />
      <meshStandardMaterial side={DoubleSide} map={colorMap} transparent />
    </mesh>
  );
}
