import { invoke } from '@tauri-apps/api';
import AdminModel from './dashboard';

export default class MapFunction extends AdminModel {
    constructor(options = {}) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.command = 'new_function';
    }

    get name() {
        return this.label;
    }

    async save() {
        await invoke('save_function', { data: this });
    }

    async delete() {
        await invoke('delete_function', { id: this.id });
    }
}
