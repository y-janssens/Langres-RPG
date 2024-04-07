import { invoke } from '@tauri-apps/api';
import AdminModel from './admin';

export default class Storyline extends AdminModel {
    constructor(options = {}) {
        super(options, 'storyline');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async save() {
        let acts = this.story.acts.filter((act) => !act.temp).filter((act) => !act.deleted);
        acts.map((act) => {
            let maps = act.content.maps.filter((mp) => !('temp' in mp) && !('deleted' in mp));
            act.content.maps = maps;
            return act;
        });
        this.story.acts = acts;
        invoke('save_storyline', { data: this, id: this.id });
    }

    static command() {
        return 'load_storyline';
    }
}
