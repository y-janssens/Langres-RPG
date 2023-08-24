import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { MainMenu } from "./components/Menu/MainMenu";
import { Game } from "./components/Game/Game";
function App() {
  return (
    <div className="main-container">
      <Router>
        <Routes>
          <Route path="/" element={<MainMenu />} />
          <Route path="/game/:id" element={<Game />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
