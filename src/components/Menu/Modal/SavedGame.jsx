import { useCallback, useMemo } from "react";
import useGameContext from "../../../hooks/useGameContext";

import { GameModel } from "../../../models";

import { Close } from "../../ui/Close";

import css from "./modal.module.css";

export const SavedGame = ({ item, onLoad = () => {}, onClose = () => {} }) => {
  const [context, setContext] = useGameContext();
  const lastSavedDate = useMemo(() => {
    const date = item.last_save_date.split(".");
    return date[0];
  }, [item]);

  const handleDelete = useCallback(() => {
    const game = new GameModel(item);
    game.delete().then(() => {
      onLoad();
    });
  }, [item]);

  return (
    <div className={css["saved-game-block"]}>
      <span
        className={css["saved-game-item"]}
        onClick={() => {
          setContext({ gameId: item.id });
          onClose();
        }}
      >
        <p>{item.player}</p>
        <p>{`Last save date: ${lastSavedDate}`}</p>
      </span>
      <Close onClick={handleDelete} />
    </div>
  );
};
