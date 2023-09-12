import React, { useEffect, useState, useRef, useMemo } from "react";
import { Canvas } from "@react-three/fiber";
import { MapControls } from "@react-three/drei";

import { useGet } from "../../hooks/useGet";
import { GameModel, World, Npcs } from "../../models";

import { useForm } from "../../hooks/useForm";
import useGameContext from "../../hooks/useGameContext";

import { Loading } from "../ui/Loading";
import { Hud } from "./Interface/Hud";
import { MapLayout as Map } from "./map/MapLayout"; // eslint-disable-line
import { InGameMenu } from "../Menu/InGameMenu";
import MapAssets from "../../models/map";

export const Game = ({ game, controls, display, position }) => {
  const [context, setContext] = useGameContext();
  const [gameMap, setGameMap] = useState([]);
  const [assets] = useState(() => new MapAssets());
  const [npcs] = useState(() => new Npcs());
  const [loading, setLoading] = useState(false);

  const id = useMemo(() => {
    if (!Object.keys(context).length || !("gameId" in context)) {
      return null;
    }
    return context.gameId;
  }, [context]);

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
      setContext({ world, controls, assets });

      if (form.save_count < 1) {
        game.save();
      }
      setLoading(false);
    }
    game.current.focus();
  }, [id, form]);

  if (!id) {
    return null;
  }

  return (
    <>
      <InGameMenu id={id} controls={controls} game={game} />
      <Loading loading={!form.id || loading || !npcs || !id}>
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
          <ambientLight intensity={0.5} />
          <pointLight
            intensity={2500}
            position={[0, 10, 0]}
            decay={2.25}
            distance={12}
            ref={pointLightRef}
          />

          {/* <directionalLight position={[-100, 100, 100]} intensity={0.25} /> */}
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
    </>
  );
};
