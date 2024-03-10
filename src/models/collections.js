import { invoke } from '@tauri-apps/api';
import AdminModel from './dashboard';

export default class Collection extends AdminModel {
    constructor(options = {}) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.command = 'new_collection';
    }

    async save() {
        await invoke('save_collection', { data: this });
    }

    async delete() {
        await invoke('delete_collection', { id: this.id });
    }
}

export class MapCollection {
    constructor(items) {
        this.maps = items.map((it) => new Collection(it)) || [];
    }
}
