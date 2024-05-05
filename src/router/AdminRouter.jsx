import { Routes, Route } from 'react-router-dom';
import AdminRoute from './AdminRoute';
import { useAdminContext } from '../hooks';
import { DashboardRouter } from './DashboardRouter';
import { DashboardContextLayer } from '../context/DashboardContext';
import { EditordRouter } from './EditorRouter';

export const AdminRouter = () => {
    const { isAdmin } = useAdminContext();

    return (
        <DashboardContextLayer>
            <Routes>
                <Route
                    path="editor/*"
                    element={
                        <AdminRoute allow={isAdmin} fallback="/">
                            <EditordRouter />
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
        </DashboardContextLayer>
    );
};
