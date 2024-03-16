import { Controler } from './pages/Controler/Controler';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { AdminContextLayer } from './context/AdminContextLayer';
import { GameContextLayer } from './context/GameContextLayer';
import { AdminRouter } from './router/AdminRouter';
import { useSettings } from './hooks/useSettings';

function App() {
    useSettings();
    return (
        <div className="main-container">
            <AdminContextLayer>
                <GameContextLayer>
                    <Router>
                        <Routes>
                            <Route exact path="/" element={<Controler />} />
                            <Route path="/admin/*" element={<AdminRouter />} />
                        </Routes>
                    </Router>
                </GameContextLayer>
            </AdminContextLayer>
        </div>
    );
}

export default App;
