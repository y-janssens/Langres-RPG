import React, { useState } from 'react';

const DashboardContext = React.createContext(null);

export const DashboardContextLayer = ({ children }) => {
    const [context, _setContext] = useState({ model: [], search: '', instance: null });

    const setContext = React.useCallback((ctx = {}) => {
        _setContext((context) => {
            return { ...context, ...ctx };
        });
    }, []);

    const removeFromContext = React.useCallback((names) => {
        if (!Array.isArray(names)) {
            names = [names];
        }
        setContext((context) => {
            let newContext = { ...context };
            names.forEach((name) => {
                delete newContext[name];
            });
            return newContext;
        });
    }, []);

    return (
        <DashboardContext.Provider
            value={{
                context,
                setContext,
                removeFromContext
            }}
        >
            {children}
        </DashboardContext.Provider>
    );
};

export default DashboardContext;
