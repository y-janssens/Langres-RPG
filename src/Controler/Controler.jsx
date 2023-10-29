import React, { useCallback, useState, useRef, useMemo } from 'react';
import { useGet } from '../hooks';
import GameContext from './GameContext';

import KeyControls from './controls';
import MapAssets from '../models/map';
import Settings from '../models/settings';
import { Npcs } from '../models';

import { Game } from '../components/Game/Game';
import { MainMenu } from '../components/Menu/MainMenu';

import css from '../components/Game/game.module.css';
import { Builder } from '../components/Builder/Builder';

export const Controler = () => {
    const [controls] = useState(() => new KeyControls());
    const [assets] = useState(() => new MapAssets());
    const [npcs] = useState(() => new Npcs());
    const [toggles, setToggles] = useState(controls.toggles);
    const [position, setPosition] = useState(controls.positions);

    const [context, _setContext] = useState({ direction: 's', devMode: true, display3d: true, controls, assets, npcs });
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
        return Boolean(context?.controls?.toggles?.pause);
    }, [context]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                controls.setPosition(event, context.world);
                setContext({ direction: controls.getKey(event), previousDirection: context.direction });
            }
            controls.setToggles(event);
            setToggles(controls.toggles);
        },
        [controls, context, pauseGame]
    );

    const displayGame = useMemo(() => {
        return Boolean(context?.gameId && !context.builder);
    }, [context]);

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
            <MainMenu />
            {displayGame && (
                <div className={css['game-main-block']} onKeyDown={handleControls} tabIndex={0} ref={gameRef}>
                    <Game pause={pauseGame} keyToggles={toggles} position={position} setPosition={setPosition} game={gameRef} />
                </div>
            )}
            {context.builder && <Builder />}
        </GameContext.Provider>
    );
};
