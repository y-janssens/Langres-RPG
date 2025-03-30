import i18next from 'i18next';
import Fetcher from './fetcher';
import { invoke } from '@tauri-apps/api/core';

export default class Settings extends Fetcher {
    constructor(options = {}) {
        super('app_datas');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
        this.setLanguage();
        this.load();
    }

    async load() {
        this.main_menu_items = await invoke('load_main_menu').then((response) => response);
        this.ingame_menu_items = await invoke('load_ingame_menu').then((response) => response);
        return this;
    }

    setLanguage() {
        console.log(`Set language: ${this.language.toUpperCase()}`);
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

    static async load() {
        return await invoke(this.command()).then((response) => new this(response));
    }

    static command(id) { // eslint-disable-line
        return 'load_app_datas';
    }

    static fromApi(id, data) { // eslint-disable-line
        return new this(data);
    }

    async save(overide = false) { // eslint-disable-line
        await invoke(`save_app_datas`, { data: this });
    }
}
