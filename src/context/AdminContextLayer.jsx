import React, { useState } from 'react';
import { useGet } from '../hooks';

const AdminContext = React.createContext(null);

export const AdminContextLayer = ({ children }) => {
    const [context, setContext] = useState(null);
    const [isAdmin, setIsAdmin] = useState(false);

    useGet(
        {
            func: 'load_admin_dashboard',
            onSuccess: (response) => {
                if (!('error' in response)) {
                    setContext(response);
                    setIsAdmin(true);
                }
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
                context,
                isAdmin
            }}
        >
            {children}
        </AdminContext.Provider>
    );
};

export default AdminContext;
