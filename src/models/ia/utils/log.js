import { v4 as uuid } from 'uuid';

export default class Logs {
    constructor({ instance, map: { id, name, primary, complete } }) {
        this.records = [];
        this.instance = instance;
        this.map = { id, name, primary, complete };
    }

    update(data) {
        if (this.records.length === 10) {
            this.records.shift();
        }
        this.records.push(new Log(data));
    }
}
class Log {
    constructor({ current, previous, player, npc, position }) {
        this.uuid = uuid();
        this.date = new Date().toISOString();
        this.state = { current, previous };
        this.player_position = player;
        this.npc_position = position;
        this.npc = npc;
    }
}
