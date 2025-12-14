import { invoke } from '@tauri-apps/api/core';

import yaml from 'js-yaml';

import AdminModel from './admin';
import World from './world';
import Npc from './npcs';

export default class Storyline extends AdminModel {
    constructor(options = {}) {
        super(options, 'storyline');
        for (const [key, value] of Object.entries(options)) {
            this[key] = value;
        }
    }

    async save() {
        let acts = this.acts.filter((act) => !act.temp).filter((act) => !act.deleted);
        acts.map((act) => {
            let maps = act.maps.filter((mp) => !('temp' in mp) && !('deleted' in mp));
            act.maps = maps;
            return act;
        });
        this.acts = acts;
        invoke('save_storyline', { story: this });
    }

    static command() {
        return 'load_storyline';
    }

    static fromApi(_, data) {
        return new this(data);
    }

    toJson() {
        return JSON.stringify(this, null, 2);
    }

    toYml() {
        const acts = this.acts.flatMap((act) => {
            const maps = act.maps.map((it) => {
                let map = new World({ ...it });
                let ct = map.content.map((it) => it.clean());
                map.content = ct;
                map.npcs = [];
                return map;
            });
            act.maps = maps;
            return act;
        });
        this.acts = acts;

        return yaml.dump(this, {
            indent: 2,
            lineWidth: -1,
            noRefs: true
        });
    }

    clean() {
        delete this.instance;
        delete this.model;
        delete this.displayFields;
        delete this.new_command;
    }

    get maps() {
        return this.acts.flatMap((act) =>
            act.maps.map((mp) => {
                let map = new World(mp);
                map.act_id = act.id;
                map.act_name = act.name;
                return map;
            })
        );
    }

    get npcs() {
        return this.acts.flatMap((act) => act.maps.flatMap((mp) => mp.npcs.map((npc) => new Npc({ ...npc }))));
    }
}
