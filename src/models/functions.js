import AdminModel from './dashboard';

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
}
