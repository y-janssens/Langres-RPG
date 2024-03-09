import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useCommand } from '../hooks';
import { Dashboard as Template } from '../pages/Dashboard/Dashboard';
import { Model, Form } from '../pages/Dashboard/model';

export const DashboardRouter = () => {
    const [models] = useCommand({ func: 'load_admin_dashboard' });

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
            {models?.map((model, index) => (
                <React.Fragment key={index}>
                    <Route
                        path={`${model.name}/*`}
                        element={
                            <Template models={models} current={model}>
                                <Model current={model} />
                            </Template>
                        }
                    />
                    <Route
                        path={`${model.name}/:id/`}
                        element={
                            <Template models={models} current={model}>
                                <Form current={model} />
                            </Template>
                        }
                    />
                </React.Fragment>
            ))}
        </Routes>
    );
};
