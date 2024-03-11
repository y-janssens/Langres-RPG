import AdminModel from './dashboard';

export default class Collection extends AdminModel {
    constructor(options = {}) {
        super(options, 'collection');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    // get map() {
    //     return this.map.id;
    // }
}

export class MapCollection {
    constructor(items) {
        this.maps = items.map((it) => new Collection(it)) || [];
    }
}
