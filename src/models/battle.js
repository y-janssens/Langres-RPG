import { invoke } from '@tauri-apps/api/core';
import { Character, Npc, Fetcher } from '.';

export default class BattleSystem extends Fetcher {
    constructor(options = {}) {
        super();
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
        this.npc = new Npc(options['npc']);
        this.character = new Character(options['character']);
        this.datas['actions'] = options['datas']['actions'].map((ac) => new BattleAction(ac));
        this.datas['objects'] = options['datas']['objects'].map((obj) => new BattleObject(obj));
    }

    get actions() {
        return this.datas.actions?.filter((ac) => !ac.defensive);
    }

    static command() {
        return 'start_battle';
    }

    static fromApi(_, data) {
        return new this(data);
    }
}

class BattleAction {
    constructor(options = {}) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async trigger(system) {
        return await invoke('battle_action', { system, action_str: this.name }).then((resp) => resp);
    }
}

class BattleObject {
    constructor(options = {}) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async trigger(system) {
        return await invoke('battle_object', { system, object_str: this.name }).then((resp) => resp);
    }
}
