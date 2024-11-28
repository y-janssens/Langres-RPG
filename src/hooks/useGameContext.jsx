import React from 'react';
import { GameContext } from '../context';

export default function useGameContext() {
    const ctx = React.useContext(GameContext);
    if (!ctx) {
        throw new Error('[useGameContext] Did you call useGameContext outside an GameContextProvider component?');
    }

    const { engine, setEngine, removeFromEngine } = ctx;

    return [engine, setEngine, removeFromEngine];
}
