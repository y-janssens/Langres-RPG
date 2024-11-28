import { Controler } from './pages/Controler/Controler';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { PermissionsContextLayer } from './context/PermissionsContextLayer';
import { GameContextLayer } from './context/GameContextLayer';
import { AdminRouter } from './router/AdminRouter';

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
                </GameContextLayer>
            </PermissionsContextLayer>
        </div>
    );
}

export default App;
