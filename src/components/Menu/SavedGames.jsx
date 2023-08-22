import React from "react";
import css from "./menu.module.css";

export const SavedGames = ({
  saves = [],
  open = { item: null, value: false },
  onClose
}) => {
  if (!saves.length || !open.item || open.item !== "saved_games") {
    return null;
  }
  return (
    <div className={css["main-menu-modal"]}>
      {saves.map((save) => {
        return (
          <p key={save.id}>
            {save.player}-{save.id}
          </p>
        );
      })}
    </div>
  );
};
