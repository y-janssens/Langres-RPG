import React from "react";
import { Game } from "../components/Game/Game";
import { Controler } from "./Controler";

export const GameProvider = () => {
  return (
    <Controler>
      <Game />
    </Controler>
  );
};
