import React from "react";

import GameContext from "../Controler/GameContext";

export default function useGameContext() {
  const ctx = React.useContext(GameContext);
  if (!ctx) {
    throw new Error(
      "[useGameContext] Did you call useGameContext outside an GameContextProvider component?"
    );
  }

  const { context, setContext, removeFromContext } = ctx;

  return [context, setContext, removeFromContext];
}
