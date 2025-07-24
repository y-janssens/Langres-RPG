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
        this.history = options['history'].map((log) => new BattleLog(log));
    }

    get actions() {
        return this.datas.actions?.filter((ac) => ac.primary);
    }

    get objects() {
        return this.datas.objects;
    }

    static command() {
        return 'start_battle';
    }

    static fromApi(_, data) {
        return new this(data);
    }

    async attack() {
        return await invoke('battle_action', { system: this, actionStr: 'attack' }).then((resp) => new BattleSystem(resp));
    }

    async flee() {
        return await invoke('battle_action', { system: this, actionStr: 'flee' }).then((resp) => new BattleSystem(resp));
    }
}

export class BattleAction {
    constructor(options = {}) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async trigger(system) {
        return await invoke('battle_action', { system, actionStr: this.name }).then((resp) => new BattleSystem(resp));
    }
}

export class BattleObject {
    constructor(options = {}) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async trigger(system) {
        return await invoke('battle_object', { system, objectStr: this.name }).then((resp) => new BattleSystem(resp));
    }
}

export class BattleLog {
    constructor(options = {}) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }
}
