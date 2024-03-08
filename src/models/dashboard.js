import i18next from 'i18next';
import { GameModel, Storyline, Collection } from '.';
export default class AdminModel {
    constructor(options) {
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
        this.displayFields = ['date', 'modified', 'created'];
    }

    match(key) {
        if (typeof key !== 'string') {
            return false;
        }
        const fields = this.displayFields.join('|');
        return new RegExp(fields, 'gi').test(key);
    }

    display(key) {
        if (!this.match(key)) {
            return this[key];
        }
        const date = new Date(String(this[key].split(' ')[0]));

        return new Intl.DateTimeFormat(i18next.language, {
            day: 'numeric',
            month: 'long',
            year: 'numeric'
        }).format(date);
    }

    static fromAPI(data, model) {
        if (!Array.isArray(data)) {
            data = [data];
        }
        switch (model) {
            case 'Game':
                return data.map((it) => new GameModel(it));
            case 'Storyline':
                return data.map((it) => new Storyline(it));
            case 'Collection':
                return data.map((it) => new Collection(it));
            default:
                throw new Error('Model is undefined or not registered');
        }
    }
}
