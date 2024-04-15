import i18next from 'i18next';
import { AdminGameModel, Storyline, Collection, MapObject, MapFunction, Quest, Fetcher, Achievement, Statistic, Loot } from '.';
import { isObject } from '../components/utils';
export default class AdminModel extends Fetcher {
    constructor(instance, model) {
        super(model);
        this.instance = instance;
        this.model = model;
        this.displayFields = ['date', 'modified', 'created'];
        this.init();
    }

    init() {
        this.new_command = `new_${this.model}`;
    }

    match(key) {
        if (typeof key !== 'string') {
            return false;
        }
        const fields = this.displayFields.join('|');
        return new RegExp(fields, 'gi').test(key);
    }

    display(key) {
        if (key === 'map') {
            return this.map?.id;
        }
        if (isObject(this[key])) {
            return this.stringify(this[key]);
        }
        if (!this.match(key) || !this[key]) {
            return this[key];
        }

        const date = new Date(String(this[key]?.split(' ')[0]));

        return new Intl.DateTimeFormat(i18next.language, {
            day: 'numeric',
            month: 'long',
            year: 'numeric'
        }).format(date);
    }

    stringify(value) {
        return JSON.stringify(value)
            .replace(/["{}]/g, '')
            .replace(/(:)(\d+)/g, ': $2')
            .replace(/,/g, ', ');
    }

    static getInstance(model) {
        switch (model) {
            case 'Game':
                return AdminGameModel;
            case 'Storyline':
                return Storyline;
            case 'Collection':
                return Collection;
            case 'Object':
                return MapObject;
            case 'Function':
                return MapFunction;
            case 'Quest':
                return Quest;
            case 'Achievement':
                return Achievement;
            case 'Statistic':
                return Statistic;
            case 'Loot':
                return Loot;
            default:
                throw new Error('Model is undefined or not registered');
        }
    }

    payload() {
        return null;
    }
}
