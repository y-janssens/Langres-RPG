import React from 'react';
import PermissionsContext from '../context/PermissionsContextLayer';

export default function usePermissionsContext() {
    const ctx = React.useContext(PermissionsContext);
    if (!ctx) {
        throw new Error('[usePermissionsContext] Did you call usePermissionsContext outside an PermissionsContextProvider component?');
    }

    const { loadingPermissions } = ctx;

    return { loadingPermissions, ...ctx.permissions };
}
