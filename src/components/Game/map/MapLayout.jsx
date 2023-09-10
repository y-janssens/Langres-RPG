import { useState, useRef, useMemo } from "react";
import { useFrame } from "@react-three/fiber";
import css from "./map.module.css";
import MapAssets from "../../../models/map";
import { Tiles } from "../Scene/Tiles";
import Character from "../Character";
import { MathUtils } from "three";

export const MapLayout = ({
  world,
  npcs,
  data,
  position,
  characterRef,
  cameraRef
}) => {
  // const initialState = { valid: [], invalid: [] };
  // const [items, setItems] = useState(initialState);
  // const [assets] = useState(() => new MapAssets());

  // const getItemsIds = useCallback(
  //   (item) => {
  //     const ids = assets.get_items_ids(item, world);
  //     setItems({ valid: ids.validIds, invalid: ids.invalidIds });
  //   },
  //   [world]
  // );

  const updateCameraPosition = () => {
    if (cameraRef.current && characterRef.current) {
      const characterPosition = characterRef.current.position;
      const distance = 25;
      cameraRef.current.object.position.x = characterPosition.x - distance;
      cameraRef.current.object.position.y = 15;
      cameraRef.current.object.position.z =
        -(distance - characterPosition.z) - distance / 1.325;
    }
  };

  useFrame(() => {
    updateCameraPosition();
  });

  return (
    <group position={[-world.width / 2, 0, -world.width / 2]}>
      <Character position={position} characterRef={characterRef} />
      <Tiles data={data} />
    </group>
  );
};
