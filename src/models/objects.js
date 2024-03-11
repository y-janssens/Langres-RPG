import AdminModel from './dashboard';

export default class MapObject extends AdminModel {
    constructor(options = {}) {
        super(options, 'object');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }
}
