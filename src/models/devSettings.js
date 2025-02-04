import { invoke } from '@tauri-apps/api/core';
import _ from 'lodash';
export default class DevSettings {
    constructor(args) {
        this.devMode = args.is_admin && args.dev_settings_enabled;
        this.defaultSettings = {};
        this.settings = {};
        this.defaultKeys = [];
        this.keys = [];
        this.init();
    }

    async init() {
        const settings = await this.loadSettings();
        const defaultSettings = _.cloneDeep(settings);

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

            if (key === 'performances') {
                return this.togglePerformances();
            }

            this.settings[label][key].value = value;
            if (setting.dynamic) {
                this.refreshGame();
            }
        });
    }

    togglePerformances() {
        const value = this.settings.global.performances.value;
        this.settings.global.performances.value = !value;

        this.settings.global.collisions.value = value;
        this.settings.game.displayObstacles.value = value;
        this.settings.game.displayTextures.value = value;
        this.settings.scene.zoom.value = value ? 1.25 : 1;

        this.refreshGame();
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
            this.settings = _.cloneDeep(this.defaultSettings);
        });
    }

    deepCompare(settings, defaultSettings) {
        return Object.keys(settings)
            .reduce((result, key) => {
                const group = settings[key];

                const groupDifferences = Object.keys(group).reduce((acc, k) => {
                    const defaultValue = defaultSettings[key]?.[k]?.value;
                    if (group[k].value !== defaultValue) {
                        acc[k] = group[k];
                    }
                    return acc;
                }, {});

                if (Object.keys(groupDifferences).length > 0) {
                    result[key] = groupDifferences;
                }

                return Object.values(result).map((it) => Object.values(it));
            }, [])
            .flat();
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

    /** Function is overriden by game's model and provides a hot reload functionnality */
    refreshGame() {}
}
