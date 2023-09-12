import useGameContext from "../../../hooks/useGameContext";
import { useRef } from "react";
import { useLoader } from "@react-three/fiber";
import { DoubleSide, TextureLoader } from "three";

export function Tree(props) {
  const [context] = useGameContext();
  const treeRef = useRef();
  const TreeColorMap = useLoader(TextureLoader, context.assets.get_tree());

  return (
    <mesh {...props} rotation={[0, 0, 0]} scale={[2, 2, 1]} ref={treeRef}>
      <planeGeometry args={[1, 1, 1]} />
      <meshStandardMaterial side={DoubleSide} map={TreeColorMap} transparent />
    </mesh>
  );
}
