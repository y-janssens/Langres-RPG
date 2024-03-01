import i18next from 'i18next';
import { invoke } from '@tauri-apps/api';

export default class Settings {
    constructor({ id, language, sound, volume, music }) {
        this.id = id;
        this.language = language;
        this.sound = sound;
        this.volume = volume;
        this.music = music;
        this.languages = [
            { key: 'en', value: 'English' },
            { key: 'fr', value: 'Français' }
        ];
        this.setLanguage();
    }

    setLanguage() {
        i18next.changeLanguage(this.language);
    }

    update(data) {
        this.language = data.language;
        this.sound = data.sound;
        this.volume = data.volume;
        this.music = data.music;

        this.setLanguage();
        this.save();
    }

    async save() {
        await invoke('save_app_datas', { id: this.id, data: this });
    }

    restoreDefaults() {
        this.language = 'en';
        this.sound = 'true';
        this.volume = '100';
        this.music = '100';
    }
}
