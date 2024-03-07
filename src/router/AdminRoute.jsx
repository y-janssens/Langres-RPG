import { Navigate } from 'react-router-dom';

function AdminRoute({ allow, fallback, children }) {
    if (!allow) {
        return <Navigate to={fallback} />;
    }
    return children;
}

export default AdminRoute;
