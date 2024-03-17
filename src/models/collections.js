import AdminModel from './admin';

export default class Collection extends AdminModel {
    constructor(options = {}) {
        super(options, 'collection');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static command(id) { // eslint-disable-line
        return 'load_collections';
    }
}
