import AdminModel from './admin';
import i18next from 'i18next';

export default class Achievement extends AdminModel {
    constructor(options = {}) {
        super(options, 'achievement');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    display(key) {
        if (key === 'name' || key === 'description') {
            return this.stringify(this[key][i18next.language]) || ' ';
        }
        return super.display(key);
    }

    static command(id) {
        if (!id) {
            return 'load_achievements';
        }
        return 'load_achievement';
    }
}
