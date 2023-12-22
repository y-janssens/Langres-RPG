import { invoke } from '@tauri-apps/api/tauri';
import { Character, World } from '.';

export default class GameModel {
    constructor({ player, id, date_created, last_save_date, save_count, character, storyline, last_known_position, context }) {
        this.player = player;
        this.id = id;
        this.date_created = date_created;
        this.last_save_date = last_save_date;
        this.save_count = save_count;
        this.storyline = storyline;
        this.character = new Character({ ...character, name: this.player });
        this.last_known_position = last_known_position;
        this.context = context;
    }

    async save() {
        await invoke('save', { data: this });
    }

    async delete() {
        await invoke('delete', { id: this.id });
    }

    get title() {
        return {
            act: {
                name: this.current_act.name,
                title: this.current_act.title
            },
            map: this.current_map.name,
            date: this.current_act.date
        };
    }

    get has_position() {
        return !Object.values(this.last_known_position).every((pos) => pos === 0);
    }

    get current_act() {
        return this.storyline.story.acts.find((act) => !act.complete);
    }

    get current_map() {
        return this.current_act.content.maps.find((mp) => (this.context.mapId ? mp.id === this.context?.mapId?.id : !mp.complete && mp.primary));
    }

    get current_world() {
        return new World(this.current_map);
    }

    validate_acts() {
        let datas = { ...this.storyline };
        let acts = datas.story.acts.map((act) => {
            if (act.content.maps.filter((mp) => Boolean(mp.primary)).every((mp) => Boolean(mp.complete))) {
                act.complete = true;
            }
            return act;
        });
        datas.story.acts = [...acts];
        return datas;
    }
}
