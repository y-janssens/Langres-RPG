import AdminModel from './dashboard';

export default class MapObject extends AdminModel {
    constructor(options = {}) {
        super(options, 'object');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    async save(overide) {
        if (overide) {
            this.area = this.area.split(',').reduce((acc, pair) => {
                const [key, value] = pair.split(':').map((part) => part.trim());
                acc[key] = Number(value);
                return acc;
            }, {});
            this.walkable = JSON.parse(this.walkable);
        }
        await super.save();
    }
}
