import React, { useCallback, useState, useRef, useMemo } from 'react';

import KeyControls from './controls';
import GameContext from './GameContext';

import { Game } from '../components/Game/Game';
import { MainMenu } from '../components/Menu/MainMenu';

import css from '../components/Game/game.module.css';

export const Controler = () => {
    const gameRef = useRef();
    const [context, _setContext] = useState({ direction: 's', devMode: true, display3d: true });
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

    const pauseGame = useMemo(() => {
        if (!context?.controls?.toggles) {
            return true;
        }
        return context.controls.toggles.pause === true;
    }, [context, context?.controls?.toggles]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                controls.setPosition(event, context.world);
                setPosition(controls.positions);
                setContext({ direction: controls.getKey(event) });
            }
            controls.setToggles(event);
            setToggles(controls.toggles);
        },
        [controls, context, pauseGame]
    );

    const displayGame = useMemo(() => {
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
            {displayGame && (
                <div className={css['game-main-block']} onKeyDown={handleControls} tabIndex={0} ref={gameRef}>
                    <Game display3d={context?.display3d} pause={pauseGame} keyToggles={toggles} position={position} game={gameRef} controls={controls} />
                </div>
            )}
        </GameContext.Provider>
    );
};
