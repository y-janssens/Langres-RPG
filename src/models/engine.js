import KeyControls from '../Controler/controls';
import BaseEngine from './baseEngine';

export default class Engine extends BaseEngine {
    constructor() {
        super();
        this.world = {};
        this.gameId = null;
        this.mapId = null;
        this.devMode = true;
        this.builder = false;
        this.applicationData = {};
        this.controls = new KeyControls();
        this.instantiate(this);
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
