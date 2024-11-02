import { Routes, Route } from 'react-router-dom';
import AdminRoute from './AdminRoute';
import { Builder, PathFinder } from '../pages';
import { useAdminContext } from '../hooks';
import { DashboardRouter } from './DashboardRouter';
import { DashboardContextLayer } from '../context/DashboardContext';


export const AdminRouter = () => {
    const { isAdmin } = useAdminContext();

    return (
        <DashboardContextLayer>
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
                <Route
                    path="pathfinder"
                    element={
                        <AdminRoute allow={isAdmin} fallback="/">
                            <PathFinder />
                        </AdminRoute>
                    }
                />
            </Routes>
        </DashboardContextLayer>
    );
};
