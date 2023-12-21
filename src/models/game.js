import { invoke } from '@tauri-apps/api/tauri';
import Character from './character';
export default class GameModel {
    constructor({ player, id, date_created, last_save_date, save_count, character, storyline, last_known_position }) {
        this.player = player;
        this.id = id;
        this.date_created = date_created;
        this.last_save_date = last_save_date;
        this.save_count = save_count;
        this.storyline = storyline;
        this.character = new Character({ ...character, name: this.player });
        this.last_known_position = last_known_position;
    }

    async save() {
        console.log('save', this);
        await invoke('save', { data: this });
    }

    async delete() {
        await invoke('delete', { id: this.id });
    }

    get has_position() {
        return !Object.values(this.last_known_position).every((pos) => pos === 0);
    }
}
