import { useCallback, useMemo, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";

import { GameModel } from "../../models";
import { useGet } from "../../hooks/useGet";

import { invoke } from "@tauri-apps/api/tauri";
import { exit } from "@tauri-apps/api/process";

import { MenuItem } from "./MenuItem";
import { Modal } from "./Modal/Modal";

import css from "./menu.module.css";

export const MainMenu = ({ context = {} }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const [openModal, setOpenModal] = useState(null);

  const inGameContext = useMemo(() => {
    return Boolean(location.pathname !== "/");
  }, [location, context]);

  const displayInGameMenu = useMemo(() => {
    return "toggles" in context && context.toggles.menu;
  }, [context]);

  const [savedGames, loadingGames, , sync] = useGet({
    func: "load_saves"
  });

  const handleNewGame = useCallback(async (name) => {
    await invoke("new", { name }).then((data) => {
      let game = new GameModel(data);
      game.save();
      navigate(`/game/${game.id}`);
    });
  }, []);

  const handleSaveGame = useCallback(() => {
    const data = savedGames?.find((gm) => gm.id === context.gameId);
    let game = new GameModel(data);
    game.save();
  }, [savedGames, context]);

  const exitGame = useCallback(async () => {
    if (!inGameContext) {
      return await exit(1);
    }
    return navigate("/");
  }, [inGameContext]);

  const lastPlayedGame = useMemo(() => {
    if (loadingGames || !savedGames?.some((gm) => Boolean(gm.last_save_date))) {
      return null;
    }
    let games = savedGames?.map((gm) => ({
      id: gm.id,
      date: new Date(gm.last_save_date.split(".")[0])
    }));
    return games.sort((a, b) => a.date < b.date)[0];
  }, [savedGames, loadingGames]);

  const items = useMemo(() => {
    let menu_items = [
      { id: 0, name: "New Game", onClick: () => setOpenModal("new_game") },
      {
        id: 1,
        name: "Load Game",
        onClick: () => setOpenModal("saved_games")
      },
      { id: 3, name: "Save Game", onClick: () => handleSaveGame() },
      { id: 4, name: "Settings", onClick: () => {} },
      {
        id: 5,
        name: inGameContext ? "Main Menu" : "Exit Game",
        onClick: () => exitGame()
      }
    ];

    if (inGameContext && displayInGameMenu) {
      let itemsToExclude = ["New Game", "Load Game"];
      return menu_items.filter((item) => !itemsToExclude.includes(item.name));
    }
    if (Boolean(lastPlayedGame)) {
      menu_items.unshift({
        id: 6,
        name: "Continue",
        onClick: () => navigate(`/game/${lastPlayedGame.id}`)
      });
    }
    return menu_items.filter((it) => it.name !== "Save Game");
  }, [
    inGameContext,
    displayInGameMenu,
    lastPlayedGame,
    exitGame,
    handleSaveGame
  ]);

  if (inGameContext && !displayInGameMenu) {
    return null;
  }

  return (
    <>
      <div className={css["menu-items-container"]}>
        {items.map((it) => {
          return <MenuItem key={it.id} name={it.name} onClick={it.onClick} />;
        })}
      </div>

      <Modal
        name="new_game"
        state={openModal}
        onClick={handleNewGame}
        onClose={() => setOpenModal(null)}
      />

      <Modal
        name="saved_games"
        state={openModal}
        items={savedGames}
        loading={loadingGames}
        sync={sync}
        onClose={() => {
          setOpenModal(null);
        }}
      />
    </>
  );
};
