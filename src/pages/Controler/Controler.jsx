import React, { useCallback, useState, useRef, useMemo, useEffect } from 'react';
import { useGameContext } from '../../hooks';

import { Game } from '../Game/Game';
import { MainMenu } from '../../components/Menu/MainMenu';
import { QuickSettings } from '../../components/settings';

export const Controler = () => {
    const [position, setPosition] = useState();
    const [engine, setEngine] = useGameContext();
    const gameRef = useRef();

    const pauseGame = useMemo(() => {
        return Boolean(engine.controls?.toggles?.pause || engine.controls?.toggles?.menu || engine.controls?.toggles.map);
    }, [engine.controls?.toggles]);

    const handleControls = useCallback(
        (event) => {
            if (!pauseGame) {
                engine.controls.setDirections(event, true);
            }

            engine.controls.setToggles(event);
            setEngine({ controls: engine.controls });
        },
        [pauseGame, engine]
    );

    useEffect(() => {
        // Keep game focus to avoid losing keyboard controls
        if (!engine.controls.toggles.input && !pauseGame && gameRef.current) {
            gameRef.current?.focus();
        }
    }, [engine, pauseGame, gameRef]);

    return (
        <>
            {engine.settings.devMode && <QuickSettings />}
            <Handler engine={engine} handleControls={handleControls} gameRef={gameRef} position={position} setPosition={setPosition} pauseGame={pauseGame} />
        </>
    );
};

const Handler = ({ engine, handleControls, gameRef, position, setPosition, pauseGame }) => {
    if (!engine.gameId) {
        return <MainMenu />;
    }

    return (
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
    );
};
