import React, { useCallback, useState } from "react";
import { useLocation } from "react-router-dom";

import KeyControls from "./controls";
import GameContext from "./GameContext";

import { Game } from "../components/Game/Game";
import { MainMenu } from "../components/Menu/MainMenu";

import css from "../components/Game/game.module.css";

export const Controler = () => {
  const location = useLocation();
  const [context, _setContext] = useState({});
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
      setToggles(controls.toggles);
      if ("world" in context) {
        controls.setPosition(event, context.world);
        setPosition(controls.positions);
      }
    },
    [controls, context]
  );

  return (
    <GameContext.Provider
      value={{
        context,
        setContext,
        removeFromContext
      }}
    >
      <div
        className={css["game-main-block"]}
        onKeyDown={handleControls}
        tabIndex={0}
      >
        {toggles.menu && location.pathname !== "/" && (
          <MainMenu context={context} />
        )}
        <Game display={toggles} position={position} />
      </div>
    </GameContext.Provider>
  );
};
