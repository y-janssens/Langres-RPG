import { Controler } from './Controler/Controler';
import { GameContextLayer } from './context/GameContextLayer';
function App() {
    return (
        <div className="main-container">
            <GameContextLayer>
                <Controler />
            </GameContextLayer>
        </div>
    );
}

export default App;
