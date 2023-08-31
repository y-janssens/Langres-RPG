import { useCallback, useMemo, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { invoke } from "@tauri-apps/api/tauri";
import { exit } from "@tauri-apps/api/process";
import { MenuItem } from "./MenuItem";
import { Modal } from "./Modal/Modal";
import { useGet } from "../../hooks/useGet";
import { GameModel } from "../classes";
import css from "./menu.module.css";

export const MainMenu = ({ context = {} }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const initialState = null;
  const [openModal, setOpenModal] = useState(initialState);

  const inGameContext = useMemo(() => {
    return Boolean(location.pathname !== "/");
  }, [location]);

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
    const data = savedGames.find((gm) => gm.id === context.gameId);
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

  return (
    <>
      <div className={css["menu-items-container"]}>
        {Boolean(lastPlayedGame) && (
          <MenuItem
            name="Continue"
            onClick={() => navigate(`/game/${lastPlayedGame.id}`)}
          />
        )}
        {!inGameContext && (
          <>
            <MenuItem
              name="New Game"
              onClick={() => setOpenModal("new_game")}
            />
            <MenuItem
              name="Load Game"
              onClick={() => setOpenModal("saved_games")}
            />
          </>
        )}
        {inGameContext && "gameId" in context && (
          <MenuItem name="Save Game" onClick={handleSaveGame} />
        )}
        <MenuItem name="Settings" />
        <MenuItem
          name={inGameContext ? "Main Menu" : "Exit Game"}
          onClick={exitGame}
        />
      </div>

      <Modal
        name="new_game"
        state={openModal}
        onClick={handleNewGame}
        onClose={() => setOpenModal(initialState)}
      />

      <Modal
        name="saved_games"
        state={openModal}
        items={savedGames}
        loading={loadingGames}
        sync={sync}
        onClose={() => {
          setOpenModal(initialState);
        }}
      />
    </>
  );
};
