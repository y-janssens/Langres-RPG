import { Routes, Route } from 'react-router-dom';
import AdminRoute from './AdminRoute';
import { Builder, Tools } from '../pages';
import { useAdminContext } from '../hooks';
import { DashboardRouter } from './DashboardRouter';
import { DashboardContextLayer } from '../context/DashboardContext';

export const AdminRouter = () => {
    const { is_admin, dashboard_enabled, dev_tools_enabled, editor_enabled } = useAdminContext();

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
