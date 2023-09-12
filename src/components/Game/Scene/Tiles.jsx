import { useState, useRef, useMemo } from "react";
import useGameContext from "../../../hooks/useGameContext";
import { DoubleSide } from "three";

export const Tiles = ({ data }) => {
  const [context] = useGameContext();
  const keys = context.controls.borderKeys;
  return data.map((row) =>
    row.map((item, index) => (
      <group key={index}>
        {keys.includes(item.value) && (
          <Tile
            position={[item.x, 0.75, item.y]}
            scale={[0.55, 1.25, 0.55]}
            item={item}
          />
        )}
        <Tile position={[item.x, 0, item.y]} item={item} flat />
      </group>
    ))
  );
};

function Tile(props) {
  const { item } = props;
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

  if (props.flat) {
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
          color={hovered ? "blue" : tileColor}
          side={DoubleSide}
        />
      </mesh>
    );
  }

  return (
    <mesh
      {...props}
      ref={meshRef}
      onPointerOver={() => setHover(true)}
      onPointerOut={() => setHover(false)}
    >
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial color={hovered ? "blue" : tileColor} />
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
