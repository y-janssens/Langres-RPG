import { invoke } from '@tauri-apps/api';

export class MapCollection {
    constructor(items) {
        this.maps = items.map((it) => new Collection(it)) || [];
    }
}

export default class Collection {
    constructor(options) {
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
