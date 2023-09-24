import { useEffect, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { Controler } from './Controler/Controler';
import Settings from './models/settings';
function App() {
    const [appDatas, setAppDatas] = useState({});

    const getDatas = async () => {
        await invoke('load_app_datas').then((response) => {
            const datas = new Settings(response);
            setAppDatas(datas);
        });
    };

    useEffect(() => {
        getDatas();
    }, []);

    if (!Object.keys(appDatas).length) {
        return null;
    }
    return (
        <div className="main-container">
            <Controler applicationData={appDatas} />
        </div>
    );
}

export default App;
