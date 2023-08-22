import { useEffect, useState } from "react";
import { invoke } from "@tauri-apps/api/tauri";
import { MainMenu } from "./components/Menu/MainMenu";
function App() {
  const [greetMsg, setGreetMsg] = useState([]);

  async function greet() {
    let saved_games = [];
    const response = await invoke("load");

    const games = response
      .replace(/Ok\(\[Game |]\)|Some\(/g, "")
      .replaceAll("{ ", '{ "')
      .replaceAll(", ", ', "')
      .replaceAll(": ", '": ')
      .replaceAll('"),', '",')
      .split(', "Game ');

    games.forEach((fn) => {
      saved_games.push(JSON.parse(fn));
    });
    setGreetMsg(saved_games);
  }

  useEffect(() => {
    greet();
  }, []);

  return (
    <div className="main-container">
      <MainMenu />
    </div>
  );
}

export default App;
