import { invoke } from '@tauri-apps/api';
import AdminModel from './dashboard';

export default class MapObject extends AdminModel {
    constructor(options = {}) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.command = 'new_object';
    }

    async save() {
        await invoke('save_object', { data: this });
    }

    async delete() {
        await invoke('delete_object', { id: this.id });
    }
}
