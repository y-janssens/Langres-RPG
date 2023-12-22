export default class World {
    constructor({ id, name, size, content, order, complete, starting_point, primary }) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.order = order;
        this.grid = this.gridify(content);
        this.complete = complete;
        this.content = content;
        this.starting_point = starting_point;
        this.primary = primary;
    }

    gridify(data) {
        const values = data.map((item) => (item.walkable ? 0 : 1));
        return Array.from({ length: Math.ceil(values.length / this.size) }, (_, index) => values.slice(index * this.size, (index + 1) * this.size));
    }
}
