import i18next from 'i18next';
import { AdminModel, Fetcher } from '.';

export default class Loot extends AdminModel {
    constructor(options = {}) {
        super(options, 'loot');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.payload = { kind: 'weapon' };
    }

    display(key) {
        if (key === 'name' || key === 'description') {
            return this.stringify(this[key][i18next.language]) || ' ';
        }
        return super.display(key);
    }

    static command(generate) { // eslint-disable-line
        if (!generate) {
            return 'load_loots';
        }
        return 'generate_loot'
    }
}


export class LootTable extends Fetcher {
    constructor(options = {}) {
        super()
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }


    static command(id) { // eslint-disable-line
        return 'generate_loot_table'
    }
}