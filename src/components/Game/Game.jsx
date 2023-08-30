import React, { useCallback, useEffect } from "react";
import { useParams } from "react-router-dom";
import { useGet } from "../../hooks/useGet";
import { useForm } from "../../hooks/useForm";
import { Loading } from "../ui/Loading";
import { GameModel, Character } from "../classes";
import { CharInfos } from "./InfoBubbles/CharInfos";

export const Game = () => {
  const { id } = useParams();

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

  const [, loadingGame, , sync] = useGet({
    func: "load_saves",
    id,
    launch: id,
    onSuccess: (response) => {
      console.log(response);
      setFormObject(response);
    }
  });

  const handleXp = useCallback(() => {
    let char = new Character(form.character);
    char.compute_xp(153);
    setFormObject({ ...form, character: char });
  }, [form, form.character, setFormObject]);

  useEffect(() => {
    if (id && form.id) {
      let game = new GameModel(form);
      game.save();
    }
  }, [form]);

  return (
    <Loading loading={!form.id || loadingGame}>
      <CharInfos character={form.character} />
    </Loading>
  );
};
