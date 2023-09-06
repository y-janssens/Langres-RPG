import { useCallback, useState } from "react";
import css from "./map.module.css";
import MapAssets from "../../../models/map";

export const MapLayout = ({ world, data }) => {
  const initialState = { valid: [], invalid: [] };
  const [items, setItems] = useState(initialState);
  const [assets] = useState(() => new MapAssets());

  const getItemsIds = useCallback(
    (item) => {
      const ids = assets.get_items_ids(item, world);
      setItems({ valid: ids.validIds, invalid: ids.invalidIds });
    },
    [world]
  );

  return data.map((row, index) => {
    return (
      <div key={index} className={css["map-row"]}>
        {row.map((item, i) => {
          return (
            <div
              key={i}
              className={`${css["map-item"]} 
              ${items.valid.includes(item.id) && css["map-item-active"]} 
              ${items.invalid.includes(item.id) && css["map-item-forbidden"]}`}
              onMouseEnter={() => getItemsIds(item)}
              onMouseLeave={() => setItems(initialState)}
            >
              {`${item.value}`}
            </div>
          );
        })}
      </div>
    );
  });
};
