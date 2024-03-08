import React, { useState } from 'react';
import { useGet } from '../hooks';

const AdminContext = React.createContext(null);

export const AdminContextLayer = ({ children }) => {
    const [isAdmin, setIsAdmin] = useState(false);

    useGet(
        {
            func: 'load_permissions',
            useLoader: false,
            onSuccess: ({ is_admin }) => {
                setIsAdmin(is_admin);
            },
            onError: () => {
                setIsAdmin(false);
            }
        },
        []
    );

    return (
        <AdminContext.Provider
            value={{
                isAdmin
            }}
        >
            {children}
        </AdminContext.Provider>
    );
};

export default AdminContext;
