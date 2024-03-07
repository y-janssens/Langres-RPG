import KeyControls from './controls';
import BaseEngine from './baseEngine';

export default class Engine extends BaseEngine {
    constructor() {
        super();
        this.world = {};
        this.gameId = null;
        this.mapId = null;
        this.devMode = true;
        this.controls = new KeyControls();

        if (!Engine.instance) {
            Engine.instance = this;
        }
        return Engine.instance;
    }

    roll(value, cap) {
        return new Dice(value, cap);
    }
}

export class Dice {
    constructor({ value, cap, result }) {
        this.value = value;
        this.cap = cap;
        this.result = result;
    }
}
