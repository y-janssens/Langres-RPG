import AdminModel from './admin';
import i18next from 'i18next';

export default class Statistic extends AdminModel {
    constructor(options = {}) {
        super(options, 'statistic');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    display(key) {
        if (key === 'name') {
            return this.stringify(this[key][i18next.language]) || ' ';
        }
        return super.display(key);
    }

    static command(id) {
        if (!id) {
            return 'load_statistics';
        }
        return 'load_statistic';
    }
}
