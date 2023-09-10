import React, { useEffect, useState, useRef } from "react";
import { useParams } from "react-router-dom";
import { Canvas } from "@react-three/fiber";
import { MapControls, PerspectiveCamera } from "@react-three/drei";

import { useGet } from "../../hooks/useGet";
import { GameModel, World, Npcs } from "../../models";

import { useForm } from "../../hooks/useForm";
import useGameContext from "../../hooks/useGameContext";

import { Loading } from "../ui/Loading";
import { Hud } from "./Interface/Hud";
import { MapLayout as Map } from "./map/MapLayout"; // eslint-disable-line

export const Game = ({ display, position }) => {
  const { id } = useParams();
  const [context, setContext] = useGameContext();
  const [gameMap, setGameMap] = useState([]);
  const [npcs] = useState(() => new Npcs());
  const [loading, setLoading] = useState(false);
  const [startingPoint, setStartingPoint] = useState([0, 0, 0]);

  const cameraRef = useRef();
  const characterRef = useRef();

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

  const [, , , syncGame] = useGet(
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
      setLoading(true);
      let game = new GameModel(form);
      let world = new World(form.world);
      let _world = world.parse();
      setContext({ world });
      setGameMap(_world);
      setStartingPoint(world.pick_starting_point(game));

      if (form.save_count < 1) {
        game.save();
      }
      setLoading(false);
    }
  }, [form, id]);

  return (
    <Loading loading={!form.id || loading || !npcs}>
      <Hud game={form} sync={syncGame} display={display} />
      <Canvas
        camera={{
          position: [0, 15, -15],
          fov: 25,
          zoom: 1
        }}
      >
        <MapControls
          makeDefault
          // enableZoom={false}
          // enableRotate={false}
          minPolarAngle={Math.PI / 3.5}
          maxPolarAngle={Math.PI / 3.5}
          minAzimuthAngle={Math.PI}
          maxAzimuthAngle={Math.PI}
          ref={cameraRef}
        />
        <ambientLight intensity={0.5} />
        <directionalLight position={[-100, 100, 100]} intensity={1} />
        <Map
          world={form.world}
          data={gameMap}
          position={position}
          cameraRef={cameraRef}
          characterRef={characterRef}
        />
      </Canvas>
    </Loading>
  );
};
