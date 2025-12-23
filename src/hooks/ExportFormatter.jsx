import { cloneDeep } from 'lodash';
import yaml from 'js-yaml';

export const EXPORT_TYPES = [
    {
        value: 'json',
        operation: (val, list) => {
            const values = val.map((it) => it.toJson());
            if (!list) return values;
            return `[${values}]`;
        }
    },
    {
        value: 'yml',
        operation: (val, list) => {
            const values = val.map((it) => it.toYml());
            if (!list) return values;
            return yaml.dump(val.map((it) => it.toYml())).replaceAll('|', '');
        }
    }
];

export const EXPORT_KEYS = {
    exportStory: {
        lookup: 'storyline',
        name: 'storyline',
        list: false
    },
    exportMaps: {
        lookup: 'maps',
        name: 'selectedMaps',
        list: true
    },
    exportNpcs: {
        lookup: 'npcs',
        name: 'selectedNpcs',
        list: true
    }
};

export class ExportFormatter {
    constructor(form) {
        this.form = form;
    }

    get extractionKeys() {
        const keys = Object.keys(EXPORT_KEYS);

        return Object.entries(this.form)
            .filter(([k, v]) => keys.includes(k) && Boolean(v))
            .map(([k, v]) => ({ ...EXPORT_KEYS[k], extension: v }));
    }

    format() {
        return this.extractionKeys.map((ek) => {
            const { name, lookup, list, extension } = ek;

            let datas = cloneDeep({ ...this.form }[lookup]);

            if (!Array.isArray(datas)) {
                datas = [datas];
            } else {
                datas = datas.filter((it) => this.form[name].includes(it.id));
            }

            datas = this.output_datas(datas, list, extension);

            return { datas, extension, name };
        });
    }

    output_datas(datas, list, extension) {
        let { operation } = EXPORT_TYPES.find((type) => type.value === extension);
        return operation(datas, list);
    }
}
