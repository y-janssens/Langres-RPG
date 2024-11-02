import React from 'react';
import { Permissions } from '../models';

const AdminContext = React.createContext(null);

export const AdminContextLayer = ({ children }) => {
    const [permissions, loadingPermissions] = Permissions.useCommand();

    if (loadingPermissions) {
        return null;
    }

    return (
        <AdminContext.Provider
            value={{
                isAdmin: permissions,
                loadingPermissions
            }}
        >
            {children}
        </AdminContext.Provider>
    );
};

export default AdminContext;
