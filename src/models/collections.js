import { invoke } from '@tauri-apps/api/tauri';
import AdminModel from './admin';

export default class Collection extends AdminModel {
    constructor(options = {}) {
        super(options, 'collection');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static async new() {
        const collection = await invoke('new_collection');
        return new this(collection);
    }

    static command(id) { // eslint-disable-line
        return 'load_collections';
    }
}
