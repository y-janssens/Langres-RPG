import { useMemo, useState } from "react";
import { useNavigate } from "react-router-dom";
import { invoke } from "@tauri-apps/api/tauri";
import { MenuItem } from "./MenuItem";
import { Modal } from "./Modal/Modal";
import { useGet } from "../../hooks/useGet";
import { GameModel } from "../classes";
import css from "./menu.module.css";

export const MainMenu = () => {
  const navigate = useNavigate();
  const initialState = null;
  const [openModal, setOpenModal] = useState(initialState);

  const [savedGames, loadingGames, , sync] = useGet({
    func: "load_saves"
  });

  async function handleNewGame(name) {
    await invoke("new", { name }).then((data) => {
      console.log(data);
      let game = new GameModel(data);
      game.save();
      navigate(`/game/${game.id}`);
    });
  }

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
        <MenuItem name="New Game" onClick={() => setOpenModal("new_game")} />
        <MenuItem
          name="Load Game"
          onClick={() => setOpenModal("saved_games")}
        />
        <MenuItem name="Settings" />
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
        onClose={() => setOpenModal(initialState)}
      />
    </>
  );
};
