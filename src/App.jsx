import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { MainMenu } from "./components/Menu/MainMenu";
import { Controler } from "./Controler/Controler";
function App() {
  return (
    <div className="main-container">
      <Router>
        <Routes>
          <Route path="/" element={<MainMenu />} />
          <Route path="/game/:id" element={<Controler />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
