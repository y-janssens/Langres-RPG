import { useState } from "react";
import { Loading } from "../../ui/Loading";
import { Close } from "../../ui/Close";
import { SavedGame } from "./SavedGame";

import css from "./modal.module.css";

export const Modal = ({
  name = null,
  loading = false,
  items = [],
  state = null,
  onClose = () => {},
  onClick = () => {},
  sync = () => {}
}) => {
  const [playerName, setPlayerName] = useState("");

  if (state !== name || loading) {
    return null;
  }

  return (
    <div className={css["modal"]}>
      <div className={css["modal-header"]}>
        <Close onClick={onClose} />
      </div>
      <div className={css["modal-body"]}>
        {name === "saved_games" && (
          <Loading loading={loading}>
            {items?.map((save) => {
              return (
                <SavedGame
                  key={save.id}
                  item={save}
                  onLoad={sync}
                  onClose={onClose}
                />
              );
            })}
          </Loading>
        )}
        {name === "new_game" && (
          <div className={css["new-game-input"]}>
            <input
              type="text"
              placeholder="Enter player name"
              value={playerName}
              onChange={(e) => setPlayerName(e.target.value)}
            />
            <button onClick={() => onClick(playerName)}>Start</button>
          </div>
        )}
      </div>
    </div>
  );
};
