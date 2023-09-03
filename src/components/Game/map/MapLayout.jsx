import { useCallback, useState } from "react";
import css from "./map.module.css";

export const MapLayout = ({ world, data }) => {
  const initialState = { valid: [], invalid: [] };
  const [items, setItems] = useState(initialState);

  const getItemsIds = useCallback(
    (item) => {
      let id = item.id;
      const ids = [id, id + 1, id - 1, id + 150, id - 150];
      let validIds = [];
      let invalidIds = [];

      ids.forEach((it) => {
        if (world.content[it] === "-") {
          validIds.push(it);
        } else {
          invalidIds.push(it);
        }
      });
      setItems({ valid: validIds, invalid: invalidIds });
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
              {item.value}
            </div>
          );
        })}
      </div>
    );
  });
};
