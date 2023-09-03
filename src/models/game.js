import { invoke } from "@tauri-apps/api/tauri";
import Character from "./character";
import World from "./world";
export default class GameModel {
  constructor({
    player,
    id,
    date_created,
    last_save_date,
    save_count,
    character,
    world
  }) {
    this.player = player;
    this.id = id;
    this.date_created = date_created;
    this.last_save_date = last_save_date;
    this.save_count = save_count;
    this.world = new World(world);
    this.character = new Character({ ...character, name: this.player });
  }

  async save() {
    await invoke("save", { data: this });
  }

  async delete() {
    await invoke("delete", { id: this.id });
  }

  regenrate_world() {
    this.world.regenerate(this);
  }
}
