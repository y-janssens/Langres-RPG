export default class World {
    constructor({ size, content, order, complete, starting_point }) {
        this.size = size;
        this.order = order;
        this.grid = this.gridify(content);
        this.complete = complete;
        this.content = content;
        this.starting_point = starting_point;
    }

    parse() {
        return this.chunk(this.content);
    }

    gridify(data) {
        const values = data.map((item) => (item.walkable ? 0 : 1));
        return this.chunk(values);
    }

    chunk(data) {
        return Array.from({ length: Math.ceil(data.length / this.size) }, (_, index) => data.slice(index * this.size, (index + 1) * this.size));
    }
}
