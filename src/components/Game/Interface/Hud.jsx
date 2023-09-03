import React from "react";
import { CharInfos } from "./Header/CharInfos";
import { Character } from "../Interface/Character/Character";
import { Inventory } from "../Interface/Inventory/Inventory";
import { Map } from "../Interface/Map/Map";

export const Hud = ({ game, sync, display }) => {
  if (!display.interface) {
    return null;
  }
  return (
    <>
      <CharInfos game={game} character={game.character} sync={sync} />
      <Map display={display.map} />
      <Inventory display={display.inventory} />
      <Character display={display.character} />
    </>
  );
};
