import i18next from 'i18next';
import Fetcher from './fetcher';
import { invoke } from '@tauri-apps/api';

export default class Settings extends Fetcher {
    constructor(options = {}) {
        super('app_datas');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
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

    restoreDefaults() {
        this.language = 'en';
        this.sound = 'true';
        this.volume = '100';
        this.music = '100';
    }

    static command(id) { // eslint-disable-line
        return 'load_app_datas';
    }

    static fromApi(id, data) { // eslint-disable-line
        return new this(data);
    }

    async save(overide = false) { // eslint-disable-line
        await invoke(`save_app_datas`, { id: this.id, data: this });
    }
}
