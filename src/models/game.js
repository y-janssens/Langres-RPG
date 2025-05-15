import { World, Character, Fetcher } from '.';

export default class GameModel extends Fetcher {
    constructor(options = {}) {
        super('game');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
        this.character = new Character(options['character']);
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

    get name() {
        return this.player;
    }

    get has_position() {
        return this.last_known_position.id !== 0;
    }

    get current_act() {
        return this.storyline.acts.find((act) => !act.complete);
    }

    get current_map() {
        return this.current_act.maps.find((mp) => (this.engine.mapId ? mp.id === this.engine?.mapId?.id : !mp.complete && mp.primary));
    }

    get current_world() {
        return new World(this.current_map);
    }

    get current_tile() {
        if (!this.has_position || this.engine.mapId) {
            return this.current_world.starting_tile;
        }
        return this.current_world.content.find((it) => it.id === this.last_known_position.id);
    }

    static command(id) {
        if (!id) {
            return 'load_games';
        }
        return 'load_game';
    }

    get model() {
        return 'game';
    }
}
