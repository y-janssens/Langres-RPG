import Fetcher from './fetcher';

export default class Loot extends Fetcher {
    constructor(options = {}) {
        super();
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static command(id) { // eslint-disable-line
        return 'generate_loot_table';
    }
}
