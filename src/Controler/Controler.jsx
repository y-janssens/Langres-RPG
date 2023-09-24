import React, { useCallback, useState, useRef, useMemo } from 'react';

import KeyControls from './controls';
import GameContext from './GameContext';

import { Game } from '../components/Game/Game';
import { MainMenu } from '../components/Menu/MainMenu';
import Title from '../components/ui/Title';

import css from '../components/Game/game.module.css';

export const Controler = ({ applicationData }) => {
    const gameRef = useRef();
    const [context, _setContext] = useState({ direction: 's', devMode: false, display3d: true, applicationData });
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
        return Boolean(context?.controls?.toggles?.pause);
    }, [context]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                controls.setPosition(event, context.world);
                setPosition(controls.positions);
                setContext({ direction: controls.getKey(event), previousDirection: context.direction });
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
            <Title display={false} />
            <MainMenu />
            {displayGame && (
                <div className={css['game-main-block']} onKeyDown={handleControls} tabIndex={0} ref={gameRef}>
                    <Game pause={pauseGame} keyToggles={toggles} position={position} setPosition={setPosition} game={gameRef} controls={controls} />
                </div>
            )}
        </GameContext.Provider>
    );
};
