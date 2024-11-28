import React, { useEffect, useState } from 'react';
import { Engine } from '../models';
import { usePermissionsContext } from '../hooks';

const GameContext = React.createContext(null);

export const GameContextLayer = ({ children }) => {
    const { is_admin, dev_settings_enabled, loadingPermissions } = usePermissionsContext();
    const [engine, _setEngine] = useState(null);

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

    useEffect(() => {
        if (!loadingPermissions && is_admin !== null) {
            _setEngine(new Engine({ is_admin, dev_settings_enabled }));
        }
    }, [loadingPermissions, is_admin]);

    if (!engine) {
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
            {children}
        </GameContext.Provider>
    );
};

export default GameContext;
