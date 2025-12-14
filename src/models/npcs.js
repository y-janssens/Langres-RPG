import { invoke } from '@tauri-apps/api/core';

import yaml from 'js-yaml';

import Fetcher from './fetcher';
import Inventory from './inventory';

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

    // eslint-disable-next-line
    static fromApi(id, data) {
        let npc = new this(data);
        npc.inventory = new Inventory(data.inventory);
        return npc;
    }

    static get statsKeys() {
        return ['end', 'for', 'hab', 'cha', 'int', 'ini', 'pv', 'level'];
    }

    toJson() {
        return JSON.stringify(this, null, 2);
    }

    toYml() {
        return yaml.dump(this, {
            indent: 2,
            lineWidth: -1,
            noRefs: true
        });
    }
}
