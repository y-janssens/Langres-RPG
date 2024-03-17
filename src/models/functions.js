import AdminModel from './admin';

export default class MapFunction extends AdminModel {
    constructor(options = {}) {
        super(options, 'function');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    get name() {
        return this.label;
    }

    static command(id) {
        if (!id) {
            return 'load_functions';
        }
        return 'load_function';
    }
}
