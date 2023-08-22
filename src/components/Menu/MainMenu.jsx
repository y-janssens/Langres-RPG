import { useEffect, useState } from "react";
import { invoke } from "@tauri-apps/api/tauri";
import { MenuItem } from "./MenuItem";
import css from "./menu.module.css";
import { SavedGames } from "./SavedGames";

export const MainMenu = () => {
  const initialState = { item: null, value: false };
  const [savedGames, setSavedGames] = useState([]);
  const [openModal, setOpenModal] = useState(initialState);

  async function handleSavedGames() {
    let saved_games = [];
    const response = await invoke("load");

    const games = response
      .replace(/Ok\(\[Game |]\)|Some\(/g, "")
      .replaceAll("{ ", '{ "')
      .replaceAll(", ", ', "')
      .replaceAll(": ", '": ')
      .replaceAll('"),', '",')
      .split(', "Game ');

    games.forEach((fn) => {
      saved_games.push(JSON.parse(fn));
    });
    setSavedGames(saved_games);
    setOpenModal({ item: "saved_games", value: true });
  }

  return (
    <>
      <div className={css["menu-items-container"]}>
        <MenuItem name="New Game" />
        <MenuItem name="Load Game" onClick={handleSavedGames} />
        <MenuItem name="Settings" />
      </div>
      <SavedGames
        saves={savedGames}
        open={openModal}
        onClose={() => setOpenModal(initialState)}
      />
    </>
  );
};
