import AdminModel from './admin';
import i18next from 'i18next';

export default class Quest extends AdminModel {
    constructor(options = {}) {
        super(options, 'quest');
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
            return 'load_quests';
        }
        return 'load_quest';
    }
}
