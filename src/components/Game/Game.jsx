import React, { useEffect, useState, useRef } from "react";
import { useParams } from "react-router-dom";
import { Canvas } from "@react-three/fiber";
import { MapControls } from "@react-three/drei";

import { useGet } from "../../hooks/useGet";
import { GameModel, World, Npcs } from "../../models";

import { useForm } from "../../hooks/useForm";
import useGameContext from "../../hooks/useGameContext";

import { Loading } from "../ui/Loading";
import { Hud } from "./Interface/Hud";
import { MapLayout as Map } from "./map/MapLayout"; // eslint-disable-line

export const Game = ({ game, controls, display, position }) => {
  const { id } = useParams();
  const [, setContext] = useGameContext();
  const [gameMap, setGameMap] = useState([]);
  const [npcs] = useState(() => new Npcs());
  const [loading, setLoading] = useState(false);

  const cameraRef = useRef();
  const characterRef = useRef();
  const pointLightRef = useRef();

  const [form, , setFormObject] = useForm({
    id: null
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
      setGameMap(_world);
      setContext({ world, controls });

      if (form.save_count < 1) {
        game.save();
      }
      setLoading(false);
    }
    game.current.focus();
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
        <color attach="background" args={[0, 0, 0]} />
        <fogExp2 attach="fog" color="black" density={0.05} />
        {/* <fog attach="fog" color="black" near={1} far={40} /> */}
        <MapControls
          makeDefault
          minPolarAngle={Math.PI / 3.5}
          maxPolarAngle={Math.PI / 3.5}
          minAzimuthAngle={Math.PI}
          maxAzimuthAngle={Math.PI}
          ref={cameraRef}
        />
        <ambientLight intensity={0.1} />
        <pointLight
          intensity={2500}
          position={[0, 10, 0]}
          decay={2.75}
          distance={12}
          ref={pointLightRef}
        />

        {/* <directionalLight position={[-100, 100, 100]} intensity={1} /> */}
        <Map
          world={form.world}
          data={gameMap}
          npcs={npcs}
          position={position}
          cameraRef={cameraRef}
          characterRef={characterRef}
          lightRef={pointLightRef}
        />
        {/* </fog> */}
      </Canvas>
    </Loading>
  );
};
