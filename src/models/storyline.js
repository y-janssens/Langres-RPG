import { invoke } from '@tauri-apps/api';
import { BaseEngine } from './';
export default class Storyline extends BaseEngine {
    constructor({ id, story }) {
        super();
        this.id = id;
        this.story = story;
        this.instantiate(this);
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
}
