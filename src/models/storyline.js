import { invoke } from '@tauri-apps/api/core';
import AdminModel from './admin';

export default class Storyline extends AdminModel {
    constructor(options = {}) {
        super(options, 'storyline');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async save() {
        let acts = this.acts.filter((act) => !act.temp).filter((act) => !act.deleted);
        acts.map((act) => {
            let maps = act.maps.filter((mp) => !('temp' in mp) && !('deleted' in mp));
            act.maps = maps;
            return act;
        });
        this.acts = acts;
        invoke('save_storyline', { story: this });
    }

    static command() {
        return 'load_storyline';
    }

    static fromApi(_, data) {
        return new this(data);
    }
}
