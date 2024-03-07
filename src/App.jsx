import { Controler } from './Controler/Controler';
import { AdminContextLayer } from './context/AdminContextLayer';
import { GameContextLayer } from './context/GameContextLayer';
function App() {
    return (
        <div className="main-container">
            <AdminContextLayer>
                <GameContextLayer>
                    <Controler />
                </GameContextLayer>
            </AdminContextLayer>
        </div>
    );
}

export default App;
