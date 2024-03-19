import React, { useCallback, useState, useRef, useMemo, useEffect } from 'react';
import { useGameContext } from '../../hooks';

import { Settings } from '../../models';

import { Game } from '../Game/Game';
import { MainMenu } from '../../components/Menu/MainMenu';

export const Controler = () => {
    const [position, setPosition] = useState();
    const [engine, setEngine] = useGameContext();
    const gameRef = useRef();

    Settings.useCommand({
        onSuccess: (response) => {
            engine.applicationData = response;
        }
    });

    const pauseGame = useMemo(() => {
        return Boolean(engine.controls?.toggles?.pause || engine.controls?.toggles?.menu || engine.controls?.toggles.map);
    }, [engine.controls?.toggles]);

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
        [pauseGame]
    );

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        if (!engine.controls.toggles.input && !pauseGame && gameRef.current) {
            gameRef.current?.focus();
        }
    }, [engine, pauseGame, gameRef]);

    if (!('applicationData' in engine)) {
        return null;
    }

    return (
        <>
            {!engine.gameId && <MainMenu />}
            {engine.gameId && (
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
        </>
    );
};
