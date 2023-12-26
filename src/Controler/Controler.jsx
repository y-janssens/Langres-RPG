import React, { useCallback, useState, useRef, useMemo, useEffect } from 'react';
import { useGet } from '../hooks';
import GameContext from './GameContext';

import KeyControls from './controls';
import Settings from '../models/settings';

import { Game } from '../components/Game/Game';
import { MainMenu } from '../components/Menu/MainMenu';

import { Builder } from '../components/Builder/Builder';
import css from '../components/Game/game.module.css';

export const Controler = () => {
    const [position, setPosition] = useState();
    const [context, _setContext] = useState({ devMode: true, controls: new KeyControls() });
    const gameRef = useRef();

    const setContext = React.useCallback((ctx = {}) => {
        _setContext((context) => {
            return { ...context, ...ctx };
        });
    }, []);

    const removeFromContext = React.useCallback((names) => {
        if (!Array.isArray(names)) {
            names = [names];
        }
        _setContext((context) => {
            let newContext = { ...context };
            names.forEach((name) => {
                delete newContext[name];
            });
            return newContext;
        });
    }, []);

    useGet(
        {
            func: 'load_app_datas',
            onSuccess: (response) => {
                const datas = new Settings(response);
                setContext({ applicationData: datas });
            }
        },
        []
    );

    const pauseGame = useMemo(() => {
        return Boolean(context?.controls?.toggles?.pause || context?.controls?.toggles?.menu);
    }, [context]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                context.controls.setDirections(event, true);
            }
            if (pauseGame && event.key === 'Escape' && Boolean(context?.pauseMenu)) {
                return setContext({ pauseMenu: false });
            } else {
                context?.controls.setToggles(event);
                setContext({ controls: context.controls });
            }
        },
        [context, pauseGame]
    );

    const displayGame = useMemo(() => {
        return Boolean(context?.gameId && !context.builder);
    }, [context]);

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        if (!context.controls.toggles.input && !pauseGame) {
            gameRef.current?.focus();
        }
    }, [context, pauseGame, gameRef]);

    if (!('applicationData' in context)) {
        return null;
    }

    return (
        <GameContext.Provider
            value={{
                context,
                setContext,
                removeFromContext
            }}
        >
            {!context?.gameId && !context.builder && <MainMenu />}
            {displayGame && (
                <div
                    className={css['game-main-block']}
                    onKeyDown={handleControls}
                    onKeyUp={(event) => {
                        context.controls.setDirections(event, false);
                    }}
                    tabIndex={0}
                    ref={gameRef}
                >
                    <Game pause={pauseGame} keyToggles={context?.controls?.toggles} position={position} setPosition={setPosition} />
                </div>
            )}
            {context.builder && <Builder />}
        </GameContext.Provider>
    );
};
