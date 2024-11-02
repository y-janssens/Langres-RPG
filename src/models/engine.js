import KeyControls from './controls';
import DevSettings from './devSettings';
import Settings from './settings';

export default class Engine {
    constructor(args) {
        this.world = {};
        this.gameId = null;
        this.mapId = null;
        this.settings = new DevSettings(args);
        this.controls = new KeyControls();
        this.init();
    }

    async init() {
        this.applicationData = await Settings.load();
    }
}

export class Dice {
    constructor({ value, cap, result }) {
        this.value = value;
        this.cap = cap;
        this.result = result;
    }

    roll(value, cap) {
        return new Dice(value, cap);
    }
}
