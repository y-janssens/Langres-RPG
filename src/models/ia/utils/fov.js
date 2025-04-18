import { uniqueList, flatten } from '../../../utils';

export default class FieldOfView {
    constructor({ item, map, direction, area = 2 }) {
        this.ids = [];
        this.map = map;
        this.item = item;
        this.area = area;
        this.size = map.size;
        this.direction = direction || 'right';
        this.xBoundary = this.getBoundary('x');
        this.yBoundary = this.getBoundary('y');
    }

    validate() {
        if (!this.item || !this.map) {
            throw new Error('[FieldOfView] item and map are mandatory');
        }
    }

    process() {
        this.validate();
        this.getPointOfView();
        this.filterObstacles();
        return this.ids;
    }

    getPointOfView() {
        const { target, primary, secondary } = this.getTargets(this.item.id);

        const baseIds = this.getNeighbours({ id: target, flat: true });
        const primaryIds = this.getNeighbours({ id: primary, flat: true });
        const secondaryIds = this.getNeighbours({ id: secondary, flat: true });
        const fullIds = baseIds.flatMap((id) => this.getNeighbours({ id, flat: true }));

        this.ids = uniqueList(fullIds, secondaryIds, primaryIds);
    }

    getDirectionalView(id) {
        const { target, primary, secondary } = this.getTargets(id);

        const baseIds = this.getNeighbours({ id: target, flat: true });
        const primaryIds = this.getNeighbours({ id: primary, flat: true });
        const secondaryIds = this.getNeighbours({ id: secondary, flat: true });
        const fullIds = baseIds.flatMap((id) => this.getNeighbours({ id, flat: true }));

        const proximity = this.item.neighbours_ids.some((nb) => primaryIds.includes(nb));

        const neighbours_ids = this.map.content
            .filter((it) => (proximity ? fullIds.includes(it.id) && it.walkable : secondaryIds.includes(it.id)))
            .flatMap((it) => it.neighbours_ids);

        return uniqueList(fullIds, neighbours_ids);
    }

    filterObstacles() {
        const obstacles = this.map.content.filter((it) => this.ids.includes(it.id) && this.filterBoundaries(it) && !it.walkable).map((it) => it.id);
        const obstaclesIds = new Set(obstacles.flatMap((obs) => this.getDirectionalView(obs)).filter((id) => id > 0));
        this.ids = this.ids.filter((id) => !obstaclesIds.has(id));
    }

    getNeighbours({ id, index = 1, flat = false }) {
        const threshold = this.getThreshold(id);
        const neighbours = {
            left: id - index,
            right: id + index,
            top_left: id - index * this.size - threshold,
            top_right: id - index * this.size + index - threshold,
            bottom_left: id + index * this.size - threshold,
            bottom_right: id + index * this.size + index - threshold
        };
        return flat ? flatten(neighbours) : neighbours;
    }

    getTargets(id) {
        const threshold = this.getThreshold(id);
        const linear = ['left', 'right'].includes(this.direction);
        return {
            target: this.getTarget(id - (linear ? threshold : 2), this.area + 2),
            primary: this.getTarget(id - threshold, this.area - 1),
            secondary: this.getTarget(id - (linear ? threshold : 1), this.area)
        };
    }

    getTarget(id, index) {
        return this.getNeighbours({ id, index })[this.direction] + this.getThreshold(id);
    }

    getThreshold(id) {
        const item = this.map.content.find((it) => it.id === Math.min(Math.max(id, 0), this.map.content.length));
        return item?.y % 2 === 0 ? 0 : 1;
    }

    filterBoundaries(item) {
        if (item.y % 2 == 0) {
            return item.x > 1 && item.x < this.xBoundary - 1 && item.y > 0 && item.y < this.yBoundary;
        }

        return item.x > 0 && item.x < this.xBoundary && item.y > 0 && item.y < this.yBoundary;
    }

    getBoundary(key) {
        return this.map.content.reduce((highest, current) => (current[key] > highest[key] ? current : highest), this.map.content[0])[key];
    }
}
