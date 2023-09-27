import { invoke } from '@tauri-apps/api';
export default class Codes {
    constructor() {
        this.codes = [];
        this.get();
    }

    async get() {
        await invoke('load_codes_datas').then((response) => {
            this.codes = response['codes'];
        });
    }

    match(value, input) {
        const reg = new RegExp(input, 'gi');
        return reg.test(value);
    }

    validate(input) {
        if (this.match(item.key, input)) {
            return item;
        }
    }
}
