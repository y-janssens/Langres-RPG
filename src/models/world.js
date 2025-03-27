export const DIRECTIONS = [null, 'top', 'bottom', 'left', 'right', 'top_left', 'top_right', 'bottom_left', 'bottom_right'];

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
}
