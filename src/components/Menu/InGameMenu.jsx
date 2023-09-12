import { useCallback, useMemo } from "react";
import useGameContext from "../../hooks/useGameContext";

import { GameModel } from "../../models";

import { MenuItem } from "./MenuItem";

import css from "./menu.module.css";

export const InGameMenu = ({ id, game, controls }) => {
  const [, , removeFromContext] = useGameContext();

  const displayInGameMenu = useMemo(() => {
    return id && controls.toggles.menu;
  }, [id, controls, controls.toggles]);

  const handleSaveGame = useCallback(() => {
    let _game = new GameModel(game);
    _game.save();
  }, [game]);

  const items = useMemo(() => {
    return [
      { id: 0, name: "Save Game", onClick: () => handleSaveGame() },
      { id: 1, name: "Settings", onClick: () => {} },
      {
        id: 2,
        name: "Main Menu",
        onClick: () => {
          removeFromContext("gameId");
          controls.resetControls();
        }
      }
    ];
  }, [handleSaveGame]);

  if (!displayInGameMenu) {
    return null;
  }

  return (
    <div className={css["menu-items-container"]}>
      {items.map((it) => {
        return <MenuItem key={it.id} name={it.name} onClick={it.onClick} />;
      })}
    </div>
  );
};
