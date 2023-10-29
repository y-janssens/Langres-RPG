import { invoke } from '@tauri-apps/api/tauri';
import Character from './character';
import World from './world';
export default class GameModel {
    constructor({ player, id, date_created, last_save_date, save_count, character, storyline }) {
        this.player = player;
        this.id = id;
        this.date_created = date_created;
        this.last_save_date = last_save_date;
        this.save_count = save_count;
        this.storyline = storyline;
        this.character = new Character({ ...character, name: this.player });
        this.last_known_position = [25, 0.75, 25];
        this.activated = [];
    }

    async save() {
        await invoke('save', { data: this });
    }

    async delete() {
        await invoke('delete', { id: this.id });
    }

    activate(ability) {
        let abilities = new Set(this.activated);
        abilities.add(ability);
        this.activated = Array.from(abilities);
    }

    deactivate(ability) {
        let abilities = new Set(this.activated);
        abilities.delete(ability);
        this.activated = Array.from(abilities);
    }

    regenrate_world() {
        this.world.regenerate(this);
    }
}
