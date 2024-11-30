import React from 'react';
import { DashboardContext } from '../context';

export default function useDashboardContext() {
    const ctx = React.useContext(DashboardContext);
    if (!ctx) {
        throw new Error('[useDashboardContext] Did you call useDashboardContext outside a DashboardContextProvider component?');
    }

    const { context, setContext, removeFromContext } = ctx;

    return [context, setContext, removeFromContext];
}
