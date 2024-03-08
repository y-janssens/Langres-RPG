import React, { useMemo } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useGet } from '../hooks';
import { Dashboard } from '../pages/Dashboard/Dashboard';

export const DashboardRouter = () => {
    const [models] = useGet(
        {
            func: 'load_admin_dashboard',
            useLoader: false
        },
        []
    );

    const routes = useMemo(() => {
        if (!models) {
            return [];
        }
        return models;
    }, [models]);

    return (
        <Routes>
            <Route
                path="/"
                Component={() => {
                    let url = window.location.pathname;
                    let redirect = url;

                    if (url === '/admin/dashboard') {
                        redirect = `/admin/dashboard/game`;
                    }
                    return <Navigate to={redirect} />;
                }}
            />
            {routes.map((model, index) => (
                <Route key={index} path={`${model.name}/*`} element={<Dashboard models={models} current={model} />} />
            ))}
        </Routes>
    );
};
