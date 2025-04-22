import Fetcher from './fetcher';
import { invoke } from '@tauri-apps/api/core';

export default class Npc extends Fetcher {
    constructor(options = {}) {
        super();
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static command(id) {
        if (!id) {
            return 'new_npc';
        }
        return 'load_npc';
    }

    async save() {
        await invoke(`save_npc`, { npc: this });
    }

    async delete() {
        await invoke(`delete_npc`, { npc: this });
    }

    static fromApi(id, data) {
        return new this(data);
    }

    static get statsKeys() {
        return ['end', 'for', 'hab', 'cha', 'int', 'ini', 'pv', 'level'];
    }
}
