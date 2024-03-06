import i18next from 'i18next';

import { invoke } from '@tauri-apps/api/tauri';

export const useSettings = async () => {
    await invoke('load_app_datas')
        .then(({ language }) => {
            console.log(`Set language: ${language.toUpperCase()}`);
            i18next.changeLanguage(language);
        })
        .catch((error) => {
            console.error(error);
        });
};
