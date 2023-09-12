import { useState, useRef, useMemo } from "react";
import useGameContext from "../../../hooks/useGameContext";
import { useLoader } from "@react-three/fiber";
import { DoubleSide, TextureLoader } from "three";
import { Tree } from "./Tree";

export const Tiles = ({ data }) => {
  const [context] = useGameContext();
  const keys = context?.controls?.borderKeys;
  const grassColorMap = useLoader(TextureLoader, context.assets.get_grass());

  return data.map((row) =>
    row.map((item, index) => (
      <group key={index}>
        {keys.includes(item.value) && (
          <Tree position={[item.x, 1, item.y]} item={item} />
        )}
        <Tile
          position={[item.x, 0, item.y]}
          item={item}
          colorMap={grassColorMap}
        />
      </group>
    ))
  );
};

function Tile(props) {
  const { item, colorMap } = props;
  const meshRef = useRef();
  const [hovered, setHover] = useState(false);

  const tileColor = useMemo(() => {
    let color;
    switch (item.value) {
      case "-":
        color = "lightgreen";
        break;
      case "F":
        color = "darkgreen";
        break;
      case "T":
        color = "green";
        break;
      case "C":
        color = "beige";
        break;
      case "R":
        color = "darkgray";
      default:
        color = "#808080";
    }
    return color;
  }, [item]);

  return (
    <mesh
      {...props}
      ref={meshRef}
      onPointerOver={() => setHover(true)}
      onPointerOut={() => setHover(false)}
      rotation={[Math.PI / 2, 0, 0]}
      scale={[0.99, 0.99, 1]}
    >
      <planeGeometry args={[1, 1, 1]} />
      <meshStandardMaterial
        color={hovered ? "blue" : "white"}
        side={DoubleSide}
        map={colorMap}
        emissive={0xffffff}
        emissiveIntensity={0.01}
      />
    </mesh>
  );
}

// <Tile key={item.id} position={[item.x, 0, item.y]} item={item} />;
// return data.map((row, index) => {
//   return (
//     <div key={index} className={css["map-row"]}>
//       {row.map((item, i) => {
//         return (
//           <div
//             key={i}
//             className={`${css["map-item"]}
//             ${items.valid.includes(item.id) && css["map-item-active"]}
//             ${items.invalid.includes(item.id) && css["map-item-forbidden"]}`}
//             onMouseEnter={() => getItemsIds(item)}
//             onMouseLeave={() => setItems(initialState)}
//           >
//             {`${item.value}`}
//           </div>
//         );
//       })}
//     </div>
//   );
// });
