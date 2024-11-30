import { Routes, Route, Navigate } from 'react-router-dom';
import { usePermissionsContext } from '../hooks';
import { DashboardContextLayer } from '../context';

import { AdminRoute, DashboardRouter } from './';

import { Builder, Tools } from '../pages';

export const AdminRouter = () => {
    const { is_admin, dashboard_enabled, dev_tools_enabled, editor_enabled } = usePermissionsContext();

    if (!is_admin) {
        return <Navigate to="/" replace />;
    }

    return (
        <DashboardContextLayer>
            <Routes>
                <Route
                    path="editor"
                    element={
                        <AdminRoute allow={is_admin && editor_enabled} fallback="/">
                            <Builder />
                        </AdminRoute>
                    }
                />
                <Route
                    path="dashboard/*"
                    element={
                        <AdminRoute allow={is_admin && dashboard_enabled} fallback="/">
                            <DashboardRouter />
                        </AdminRoute>
                    }
                />
                <Route
                    path="tools"
                    element={
                        <AdminRoute allow={is_admin && dev_tools_enabled} fallback="/">
                            <Tools />
                        </AdminRoute>
                    }
                />
            </Routes>
        </DashboardContextLayer>
    );
};
