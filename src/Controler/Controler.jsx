import React, { useCallback, useState } from "react";
import { useLocation } from "react-router-dom";
import GameContext from "./GameContext";
import { Game } from "../components/Game/Game";
import { MainMenu } from "../components/Menu/MainMenu";

export const Controler = () => {
  const location = useLocation();
  const [context, _setContext] = useState({});
  const [toggleMenu, setToggleMenu] = useState(false);

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

  const handleMenu = useCallback(
    (event) => {
      if (event.code === "Escape" && location.pathname !== "/") {
        setToggleMenu((prevToggle) => !prevToggle);
      }
    },
    [location, toggleMenu]
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
        style={{ position: "absolute", width: "100%", height: "100%" }}
        onKeyDown={handleMenu}
        tabIndex={0}
      >
        {toggleMenu && <MainMenu context={context} />}
        <Game />
      </div>
    </GameContext.Provider>
  );
};
