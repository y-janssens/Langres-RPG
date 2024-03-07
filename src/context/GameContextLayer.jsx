import React, { useState } from 'react';
import { Engine } from '../models';

const GameContext = React.createContext(null);

export const GameContextLayer = ({ children }) => {
    const [engine, _setEngine] = useState(() => new Engine());

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

    return (
        <GameContext.Provider
            value={{
                engine,
                setEngine,
                removeFromEngine
            }}
        >
            {children}
        </GameContext.Provider>
    );
};

export default GameContext;
