import { invoke } from '@tauri-apps/api/tauri';
import _ from 'lodash';
export default class DevSettings {
    constructor(args) {
        this.devMode = args.is_admin && args.dev_settings_enabled;
        this.defaultSettings = {};
        this.settings = {};
        this.defaultKeys = [];
        this.keys = [];
        this.refreshGame = () => {
            // Function is overriden by game's model and provides a hot reload functionnality
        };
        this.init();
    }

    async init() {
        const settings = await this.loadSettings();
        const defaultSettings = Object.freeze(await this.loadSettings());

        this.settings = settings;
        this.defaultSettings = defaultSettings;
        this.keys = this.flattenValues(settings);
        this.defaultKeys = this.flattenValues(defaultSettings);
    }

    async loadSettings() {
        return await invoke('load_dev_settings').then((resp) => resp);
    }

    validate(fn, ...args) {
        if (!this.devMode) {
            return;
        }
        return fn(...args);
    }

    toggle(label, key, value) {
        this.validate(() => {
            const setting = this.settings[label][key];
            if (!setting.mutable) return;

            this.settings[label][key].value = value;
            if (setting.dynamic) {
                this.refreshGame();
            }
        });
    }

    defaultProperty(property) {
        return this.values('defaultSettings')[property].value;
    }

    resolveSettingsProperty(property) {
        return this.values('settings')[property];
    }

    values(key) {
        return Object.entries(this[key]).reduce((acc, [, key]) => {
            return { ...acc, ...key };
        }, {});
    }

    async reset() {
        this.validate(async () => {
            if (_.isEqual(this.settings, this.defaultSettings)) return;
            this.mustRefreshGame();
            this.settings = await this.loadSettings();
        });
    }

    deepCompare(settings, defaultSettings) {
        return Object.keys(settings).reduce((result, key) => {
            const group = settings[key];

            const groupDifferences = Object.keys(group).reduce((acc, k) => {
                if (group[k].value !== defaultSettings[key]?.[k]?.value) {
                    acc[k] = group[k];
                }
                return acc;
            }, {});

            if (Object.keys(groupDifferences).length > 0) {
                result[key] = groupDifferences;
            }

            return Object.values(result).reduce((acc, key) => {
                acc = [...acc, ...Object.values(key)];
                return acc;
            }, []);
        }, {});
    }

    mustRefreshGame() {
        const differences = this.deepCompare(this.settings, this.defaultSettings);
        if (!differences || !differences?.some((it) => it.dynamic)) return;
        return this.refreshGame();
    }

    flattenValues(settings) {
        return Object.keys(settings).reduce((acc, cat) => {
            acc[cat] = Object.keys(settings[cat]);
            return acc;
        }, {});
    }
}
