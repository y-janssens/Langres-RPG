import i18next from 'i18next';
import { GameModel, Storyline, Collection, MapObject, MapFunction } from '.';
import { isArray, isObject } from '../components/utils';
export default class AdminModel {
    constructor(instance) {
        this.instance = instance;
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

    static fromAPI(data, model) {
        if (!isArray(data)) {
            data = [data];
        }
        switch (model) {
            case 'Game':
                return data.map((it) => new GameModel(it));
            case 'Storyline':
                return data.map((it) => new Storyline(it));
            case 'Collection':
                return data.map((it) => new Collection(it));
            case 'Object':
                return data.map((it) => new MapObject(it));
            case 'Function':
                return data.map((it) => new MapFunction(it));
            default:
                throw new Error('Model is undefined or not registered');
        }
    }

    static getInstance(model) {
        switch (model) {
            case 'Game':
                return GameModel;
            case 'Storyline':
                return Storyline;
            case 'Collection':
                return Collection;
            case 'Object':
                return MapObject;
            case 'Function':
                return MapFunction;
            default:
                throw new Error('Model is undefined or not registered');
        }
    }
}
