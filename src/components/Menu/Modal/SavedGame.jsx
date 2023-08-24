import { useCallback, useMemo } from "react";
import { useNavigate } from "react-router-dom";
import { Close } from "../../ui/Close";
import css from "./modal.module.css";
import { GameModel } from "../../classes";

export const SavedGame = ({ item, onLoad = () => {} }) => {
  const navigate = useNavigate();
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
        onClick={() => navigate(`/game/${item.id}`)}
      >
        <p>{item.player}</p>
        <p>{`Last save date: ${lastSavedDate}`}</p>
      </span>
      <Close onClick={handleDelete} />
    </div>
  );
};
