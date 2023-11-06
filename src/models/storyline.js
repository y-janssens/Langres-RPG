import { invoke } from '@tauri-apps/api/tauri';
export default class Storyline {
    constructor({ id, story }) {
        this.id = id;
        this.story = story;
    }

    async save() {
        let acts = this.story.acts.filter((act) => !act.temp);
        acts.map((act, i) => {
            let maps = act.content.maps.filter((mp) => !('temp' in mp));
            act.content.maps = maps;
            if (!act.temp) {
                return act;
            }
        });
        this.story.acts = acts;
        invoke('save_storyline', { data: this, id: this.id });
    }
}
