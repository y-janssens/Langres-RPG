import { invoke } from '@tauri-apps/api';
import { Character, World } from '.';

export default class GameModel {
    constructor({ player, id, date_created, last_save_date, save_count, character, storyline, last_known_position, engine }) {
        this.player = player;
        this.id = id;
        this.date_created = date_created;
        this.last_save_date = last_save_date;
        this.save_count = save_count;
        this.storyline = storyline;
        this.character = new Character({ ...character, name: this.player });
        this.last_known_position = last_known_position;
        this.engine = engine;
        this.init();
    }

    async save() {
        await invoke('save', { data: this });
    }

    async delete() {
        await invoke('delete', { id: this.id });
    }

    init() {
        console.log(`Game Id: %c${this.id}`, 'color:green; font-weight:bold');
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
        return this.current_act.content.maps.find((mp) => (this.engine.mapid ? mp.id === this.engine?.mapId?.id : !mp.complete && mp.primary));
    }

    get current_world() {
        return new World(this.current_map);
    }
}
