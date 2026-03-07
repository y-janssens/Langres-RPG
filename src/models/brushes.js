import { Fetcher } from '.';

export default class Brush extends Fetcher {
    constructor(options = {}) {
        super();
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    static command(id) { // eslint-disable-line
        return 'load_drawer_brushes';
    }
}
