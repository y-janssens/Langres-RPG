export default class Node {
    constructor({ x, y, id, walkable, orig, size }) {
        this.x = x;
        this.y = y;
        this.walkable = walkable;
        this.orig = orig;
        this.size = size;
        this.id = id;
    }

    // Return format with basic coordinates and id for item retrieval
    get output() {
        return { x: this.orig.x, y: this.orig.y, id: this.id };
    }

    getCoordinates(key) {
        const { x, y } = this;
        const isEvenRow = y % 2 === 0;

        const coordinates = {
            top_left: [isEvenRow ? x : x - 1, y - 1],
            top_right: [isEvenRow ? x + 1 : x, y - 1],
            left: [x - 1, y],
            right: [x + 1, y],
            bottom_left: [isEvenRow ? x : x - 1, y + 1],
            bottom_right: [isEvenRow ? x + 1 : x, y + 1]
        };

        return coordinates[key];
    }
}
