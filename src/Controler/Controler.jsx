import React, { useCallback, useState, useRef, useMemo } from "react";

import KeyControls from "./controls";
import GameContext from "./GameContext";

import { Game } from "../components/Game/Game";
import { MainMenu } from "../components/Menu/MainMenu";

import css from "../components/Game/game.module.css";

export const Controler = () => {
  const gameRef = useRef();
  const [context, _setContext] = useState({ direction: "s" });
  const [controls] = useState(() => new KeyControls());
  const [toggles, setToggles] = useState(controls.toggles);
  const [position, setPosition] = useState(controls.positions);

  const setContext = React.useCallback((ctx = {}) => {
    _setContext((context) => {
      return { ...context, ...ctx };
    });
  }, []);

  const removeFromContext = React.useCallback((name) => {
    _setContext((context) => {
      let newContext = { ...context };
      delete newContext[name];
      return newContext;
    });
  }, []);

  const handleControls = useCallback(
    (event) => {
      controls.setToggles(event);
      controls.setPosition(event, context.world);
      setToggles(controls.toggles);
      setPosition(controls.positions);
      setContext({ direction: controls.getKey(event) });
    },
    [controls, context]
  );

  const displayGame = useMemo(() => {
    // if (!context || !('gameId' in context)) {
    //   return false
    // }
    return Boolean(context?.gameId);
  }, [context]);

  return (
    <GameContext.Provider
      value={{
        context,
        setContext,
        removeFromContext
      }}
    >
      <MainMenu />
      <div
        className={css["game-main-block"]}
        onKeyDown={handleControls}
        tabIndex={0}
        ref={gameRef}
      >
        {displayGame && (
          <Game
            display={toggles}
            position={position}
            game={gameRef}
            controls={controls}
          />
        )}
      </div>
    </GameContext.Provider>
  );
};
