export default class World {
    constructor({ id, name, size, content, order, complete, starting_point, primary }) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.order = order;
        this.grid = this.gridify(content);
        this.hex = this.hexify(content);
        this.complete = complete;
        this.rows = this.toRows(content);
        this.content = content;
        this.starting_point = { x: starting_point.x / 1.5, y: starting_point.y + 2 };
        this.primary = primary;
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
}
