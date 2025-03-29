import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';

import { PermissionsContextLayer, GameContextLayer } from './context';
import { AdminRouter } from './router';

import { Controler } from './pages';
import { ToastContainer } from 'react-toastify';

function App() {
    return (
        <div className="main-container">
            <PermissionsContextLayer>
                <GameContextLayer>
                    <Router>
                        <Routes>
                            <Route exact path="/" element={<Controler />} />
                            <Route path="/admin/*" element={<AdminRouter />} />
                            <Route path="*" element={<Navigate to="/" replace />} />
                        </Routes>
                    </Router>
                    <ToastContainer />
                </GameContextLayer>
            </PermissionsContextLayer>
        </div>
    );
}

export default App;
