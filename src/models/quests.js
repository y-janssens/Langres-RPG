import AdminModel from './admin';

export default class Quest extends AdminModel {
    constructor(options = {}) {
        super(options, 'quest');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static command(id) {
        if (!id) {
            return 'load_quests';
        }
        return 'load_quest';
    }
}
