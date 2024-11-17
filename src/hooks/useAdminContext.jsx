import React from 'react';
import AdminContext from '../context/AdminContextLayer';

export default function useAdminContext() {
    const ctx = React.useContext(AdminContext);
    if (!ctx) {
        throw new Error('[useAdminContext] Did you call useAdminContext outside an AdminContextProvider component?');
    }

    const { loadingPermissions} = ctx;
    

    return { loadingPermissions, ...ctx.permissions };
}
