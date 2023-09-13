import { useState, useRef } from "react";
import useGameContext from "../../../hooks/useGameContext";
import { DoubleSide } from "three";
import { Tree } from "./Tree";

export const Tiles = ({ data }) => {
  const [context] = useGameContext();
  const [treeColorMap] = useState(() => context.assets.get_trees(data));
  const [grassColorMap] = useState(() => context.assets.get_grass());

  return data.map((row) =>
    row.map((item, index) => {
      return (
        <group key={index}>
          {item.value === "T" && (
            <Tree
              position={[item.x, 1, item.y]}
              colorMap={treeColorMap.find((it) => it.id === item.id).map}
            />
          )}
          <Tile position={[item.x, 0, item.y]} colorMap={grassColorMap} />
        </group>
      );
    })
  );
};

function Tile({ position, colorMap }) {
  const meshRef = useRef();

  return (
    <mesh
      ref={meshRef}
      position={position}
      rotation={[Math.PI / 2, 0, 0]}
      scale={[0.99, 0.99, 1]}
    >
      <planeGeometry args={[1, 1, 1]} />
      <meshStandardMaterial
        color={"white"}
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
