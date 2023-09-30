import { invoke } from '@tauri-apps/api';
export default class Codes {
    constructor() {
        this.codes = [];
        this.validatedKeys = [];
        this.get();
        this.alertTimeout = null;
    }

    async get() {
        await invoke('load_codes_datas').then((response) => {
            this.codes = response['codes'];
        });
    }

    validate(input, game) {
        const key = this.codes.find((it) => it.key === input);
        if (key && !this.validatedKeys.includes(key)) {
            this.validatedKeys.push(key);
            game.activate(key);
        }
    }

    get keys() {
        return this.validatedKeys;
    }
}
