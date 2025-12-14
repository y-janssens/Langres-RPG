import Fetcher from './fetcher';

import yaml from 'js-yaml';

export const DIRECTIONS = [null, 'top', 'bottom', 'left', 'right', 'top_left', 'top_right', 'bottom_left', 'bottom_right'];
export const CARDINAL_DIRECTIONS = ['left', 'top_left', 'top_right', 'right', 'bottom_right', 'bottom_left'];

export default class World {
    constructor(options = {}) {
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.content = [...options['content']].map((it) => new Tile({ ...it, size: this.size }));
        this.starting_point = { x: options['starting_point'].x / 1.5, y: options['starting_point'].y + 2, id: options['starting_point'].id };
    }

    parseContent(data) {
        return data.map((it) => {
            it.y = Number(it.y.toFixed(2));
            return it;
        });
    }

    toJson() {
        return JSON.stringify({ ...this }, null, 2);
    }

    toYml() {
        const map = { ...this };
        const content = map.content.map((it) => it.clean());
        map.content = content;
        map.npcs = [];
        return yaml.dump(map, {
            indent: 2,
            lineWidth: -1,
            noRefs: true
        });
    }

    get starting_tile() {
        return this.content.find((it) => it.id === this.starting_point.id);
    }
}

export class Tile {
    constructor(options = {}) {
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    get hasGateway() {
        return this.events.some((ev) => Object.keys(ev.type)[0] === 'GateWay');
    }

    get gateway() {
        if (!this.hasGateway) {
            return null;
        }
        return this.events.find((ev) => Object.keys(ev.type)[0] === 'GateWay')?.type['GateWay'];
    }

    clean() {
        return this.value;
    }
}

export class WorldStatistics extends Fetcher {
    constructor(options = {}) {
        super();
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    static fromApi(_, data) {
        return new this(data);
    }

    static command() {
        return 'generate_map_analysis';
    }
}
