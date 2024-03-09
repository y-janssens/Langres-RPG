import { invoke } from '@tauri-apps/api';
import AdminModel from './dashboard';

export default class Collection extends AdminModel {
    constructor(options) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    async save(id = null) {
        let payload = { ...this };
        let command = id ? 'patch_collections' : 'save_collections';
        await invoke(command, { id, data: payload });
    }
}

export class MapCollection {
    constructor(items) {
        this.maps = items.map((it) => new Collection(it)) || [];
    }
}
