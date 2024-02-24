import React, { useCallback, useState, useRef, useMemo, useEffect } from 'react';
import { useGet } from '../hooks';
import GameContext from './GameContext';

import Settings from '../models/settings';

import { Game } from '../components/Game/Game';
import { MainMenu } from '../components/Menu/MainMenu';

import { Builder } from '../components/Builder/Builder';
import css from '../components/Game/game.module.css';
import Engine from '../models/engine';

export const Controler = () => {
    const [position, setPosition] = useState();
    const [engine, _setEngine] = useState(() => new Engine());
    const gameRef = useRef();

    const setEngine = React.useCallback((ctx = {}) => {
        _setEngine((engine) => {
            return { ...engine, ...ctx };
        });
    }, []);

    const removeFromEngine = React.useCallback((names) => {
        if (!Array.isArray(names)) {
            names = [names];
        }
        _setEngine((engine) => {
            let newContext = { ...engine };
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
                engine?.set('applicationData', new Settings(response));
            }
        },
        []
    );

    const pauseGame = useMemo(() => {
        return Boolean(engine.controls?.toggles?.pause || engine.controls?.toggles?.menu || engine.controls?.toggles.map);
    }, [engine]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                engine.controls.setDirections(event, true);
            }
            if (pauseGame && event.key === 'Escape' && Boolean(engine?.pauseMenu)) {
                return setEngine({ pauseMenu: false });
            } else {
                engine.controls.setToggles(event);
                setEngine({ controls: engine.controls });
            }
        },
        [engine, pauseGame]
    );

    const displayGame = useMemo(() => {
        return Boolean(engine.gameId && !engine.builder);
    }, [engine]);

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        if (!engine.controls.toggles.input && !pauseGame) {
            gameRef.current?.focus();
        }
    }, [engine, pauseGame, gameRef]);

    if (!('applicationData' in engine)) {
        return null;
    }

    return (
        <GameContext.Provider
            value={{
                engine,
                setEngine,
                removeFromEngine
            }}
        >
            {!engine.gameId && !engine.builder && <MainMenu />}
            {displayGame && (
                <div
                    className={css['game-main-block']}
                    onKeyDown={handleControls}
                    onKeyUp={(event) => {
                        engine.controls.setDirections(event, false);
                    }}
                    tabIndex={0}
                    ref={gameRef}
                >
                    <Game pause={pauseGame} keyToggles={engine.controls?.toggles} position={position} setPosition={setPosition} />
                </div>
            )}
            {engine.builder && <Builder />}
        </GameContext.Provider>
    );
};
