import MapAssets from './map';
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
        let content = this.content;
        return Array.from({ length: Math.ceil(content.length / this.size) }, (_, index) => content.slice(index * this.size, (index + 1) * this.size));
    }

    gridify(data) {
        const autorisedKeys = new Set(new MapAssets().validKeys);
        const values = data.map((item) => (autorisedKeys.has(item.value) ? 0 : 1));
        return Array.from({ length: Math.ceil(values.length / this.size) }, (_, index) => values.slice(index * this.size, (index + 1) * this.size));
    }
}
