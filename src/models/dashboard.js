import { invoke } from '@tauri-apps/api';
import i18next from 'i18next';
import { GameModel, Storyline, Collection, MapObject, MapFunction } from '.';
import { isArray, isObject } from '../components/utils';
export default class AdminModel {
    constructor(instance, model) {
        this.instance = instance;
        this.model = model;
        this.displayFields = ['date', 'modified', 'created'];
        this.init();
    }

    init() {
        this.new_command = `new_${this.model}`;
        this.save_command = `save_${this.model}`;
        this.delete_command = `delete_${this.model}`;
    }

    async save() {
        await invoke(this.save_command, { data: this });
    }

    async delete() {
        await invoke(this.delete_command, { id: this.id });
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
        switch (model.model) {
            case 'Game':
                return data.map((it) => new GameModel(it, model.name));
            case 'Storyline':
                return data.map((it) => new Storyline(it, model.name));
            case 'Collection':
                return data.map((it) => new Collection(it, model.name));
            case 'Object':
                return data.map((it) => new MapObject(it, model.name));
            case 'Function':
                return data.map((it) => new MapFunction(it, model.name));
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
