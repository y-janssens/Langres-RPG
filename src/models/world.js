export default class World {
    constructor(options = {}) {
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.grid = this.gridify(options['content']);
        this.hex = this.hexify(options['content']);
        this.rows = this.toRows(options['content']);
        this.content = [...options['content']].map((it) => new Tile(it));
        this.starting_point = { x: options['starting_point'].x / 1.5, y: options['starting_point'].y + 2, id: options['starting_point'].id };
    }

    gridify(data) {
        const values = data.map((item) => (item.walkable ? 0 : 1));
        return Array.from({ length: Math.ceil(values.length / this.size) }, (_, index) => values.slice(index * this.size, (index + 1) * this.size));
    }

    hexify(data) {
        return data.map((item) => {
            return [item.x, item.y, item.walkable ? 0 : 1];
        });
    }

    parseContent(data) {
        return data.map((it) => {
            it.y = Number(it.y.toFixed(2));
            return it;
        });
    }

    toRows(data) {
        return Array.from({ length: Math.ceil(data.length / this.size) }, (_, index) => data.slice(index * this.size, (index + 1) * this.size));
    }

    get starting_tile() {
        return this.content.find((it) => it.id === this.starting_point.id);
    }
}

class Tile {
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
