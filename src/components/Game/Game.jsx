import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

import { useGet } from "../../hooks/useGet";
import { GameModel, World } from "../../models";

import { useForm } from "../../hooks/useForm";
import useGameContext from "../../hooks/useGameContext";

import { Loading } from "../ui/Loading";
import { Hud } from "./Interface/Hud";
import { MapLayout } from "./map/MapLayout"; // eslint-disable-line

import css from "./game.module.css";

export const Game = ({ display }) => {
  const { id } = useParams();
  const [, setContext] = useGameContext();
  const [gameMap, setGameMap] = useState([]);

  const [form, setForm, setFormObject] = useForm({
    player: "",
    id: null,
    date_created: "",
    last_save_date: "",
    save_count: 0,
    character: {
      name: "",
      _end: 8,
      _for: 8,
      _hab: 8,
      _cha: 8,
      _int: 8,
      _ini: 8,
      _pv: 60,
      xp: 0,
      gold: 10,
      max_xp: 150,
      lvl: 1,
      inventory: {
        right_hand: "Sword",
        left_hand: "Shield",
        head: "Helmet",
        torso: "Armor",
        legs: "Legs",
        objects: []
      }
    }
  });

  const [, loadingGame, , syncGame] = useGet(
    {
      func: "load_game",
      id: parseInt(id),
      launch: id,
      onSuccess: (response) => {
        setFormObject(response);
        setContext({ gameId: parseInt(id) });
      }
    },
    [id]
  );

  // const handleXp = useCallback(() => {
  //   let char = new Character(form.character);
  //   char.compute_xp(153);
  //   setFormObject({ ...form, character: char });
  // }, [form, form.character, setFormObject]);

  useEffect(() => {
    if (id && form.id) {
      let game = new GameModel(form);
      let world = new World(form.world);
      let _world = world.parse();
      setGameMap(_world);
      game.save();
    }
  }, [form, id]);

  return (
    <Loading loading={!form.id || loadingGame}>
      <Hud game={form} sync={syncGame} display={display} />
      <div className={css["game-container"]}>
        <MapLayout world={form.world} data={gameMap} />
      </div>
    </Loading>
  );
};
