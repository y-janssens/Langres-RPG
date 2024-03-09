// import { invoke } from '@tauri-apps/api';
import AdminModel from './dashboard';

export default class MapFunction extends AdminModel {
    constructor(options) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    get name() {
        return this.label;
    }

    // async save(id = null) {
    //     let payload = { ...this };
    //     let command = id ? 'patch_collections' : 'save_collections';
    //     await invoke(command, { id, data: payload });
    // }
}
