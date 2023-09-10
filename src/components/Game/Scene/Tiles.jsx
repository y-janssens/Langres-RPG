import { useState, useRef, useMemo } from "react";

export const Tiles = ({ data }) => {
  return data.map((row) =>
    row.map((item, index) => (
      <group key={index}>
        {item.value === "T" && (
          <Tile
            position={[item.x, 0.75, item.y]}
            scale={[0.55, 1.25, 0.55]}
            item={item}
          />
        )}
        <Tile
          position={[item.x, 0, item.y]}
          item={item}
          scale={[0.95, 0.25, 0.95]}
        />
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
