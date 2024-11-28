import React from 'react';
import { Permissions } from '../models';

const PermissionsContext = React.createContext(null);

export const PermissionsContextLayer = ({ children }) => {
    const [permissions, loadingPermissions] = Permissions.useCommand();

    if (!permissions || loadingPermissions) {
        return null;
    }

    return (
        <PermissionsContext.Provider
            value={{
                permissions,
                loadingPermissions
            }}
        >
            {children}
        </PermissionsContext.Provider>
    );
};

export default PermissionsContext;
