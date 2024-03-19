import Fetcher from './fetcher';

export default class Permissions extends Fetcher {
    constructor(options = {}) {
        super(options);
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static command(id) { // eslint-disable-line
        return 'load_permissions';
    }

    static fromApi(id, data) { // eslint-disable-line
        return new this(data).is_admin;
    }
}
