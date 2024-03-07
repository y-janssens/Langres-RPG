import React, { useCallback, useState, useRef, useMemo, useEffect } from 'react';
import { useAdminContext, useGameContext, useGet } from '../../hooks';

import { Settings } from '../../models';

import { Game } from '../Game/Game';
import { MainMenu } from '../../components/Menu/MainMenu';

import { Builder } from '../Builder/Builder';
import { Dashboard } from '../Dashboard/Dashboard';

export const Controler = () => {
    const [position, setPosition] = useState();
    const [engine, setEngine] = useGameContext();
    const { isAdmin } = useAdminContext();
    const gameRef = useRef();

    useGet(
        {
            func: 'load_app_datas',
            onSuccess: (response) => {
                engine.applicationData = new Settings(response);
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
        <>
            {!engine.gameId && !engine.builder && <MainMenu />}
            {displayGame && (
                <div
                    className={'game-main-block'}
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
            {engine.builder && isAdmin && <Builder />}
            {engine.dashboard && isAdmin && <Dashboard />}
        </>
    );
};
