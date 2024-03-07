import { Routes, Route } from 'react-router-dom';
import AdminRoute from './AdminRoute';
import { Builder } from '../pages/Builder/Builder';
import { useAdminContext } from '../hooks';
import { DashboardRouter } from './DashboardRouter';

export const AdminRouter = () => {
    const { isAdmin } = useAdminContext();

    return (
        <Routes>
            <Route
                path="editor"
                element={
                    <AdminRoute allow={isAdmin} fallback="/">
                        <Builder />
                    </AdminRoute>
                }
            />
            <Route
                path="dashboard/*"
                element={
                    <AdminRoute allow={isAdmin} fallback="/">
                        <DashboardRouter />
                    </AdminRoute>
                }
            />
        </Routes>
    );
};
