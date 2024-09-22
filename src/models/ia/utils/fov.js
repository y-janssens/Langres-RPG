import { uniqueList, flatten } from '../../../components/utils';

export default class FieldOfView {
    constructor({ item, map, direction, area = 2 }) {
        this.ids = [];
        this.map = map;
        this.item = item;
        this.area = area;
        this.size = map.size;
        this.direction = direction || 'right';
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
        const { target, secondary } = this.getTargets();
        const baseIds = this.getNeighbours({ id: target - this.getThreshold(target), flat: true });
        const intermediateIds = this.getNeighbours({ id: secondary, flat: true });
        const fullIds = this.computeIds(baseIds);

        this.ids = uniqueList(fullIds, intermediateIds);
    }

    filterObstacles() {
        const { contiguousObstacles, isolatedObstacles } = new Obstacles({
            obstacles: this.map.content.filter((it) => !it.walkable).map((it) => it),
            filterIds: this.ids
        });

        const standalone_obstacles = this.parseObstaclesList(isolatedObstacles);
        const contiguous_obstacles = contiguousObstacles.flatMap((obsts) => this.parseObstaclesList(obsts));

        this.ids = this.outputObstacles(uniqueList(standalone_obstacles, contiguous_obstacles));
    }

    outputObstacles(obstacles) {
        const baseNeighbours = this.getNeighbours({ id: this.item.id, flat: true });
        if (baseNeighbours.some((it) => obstacles.includes(it))) {
            return [];
        }
        return this.ids.filter((it) => !obstacles.includes(it));
    }

    parseObstaclesList(list) {
        return list.flatMap((obs) => {
            const obstacle = this.getTarget(obs.id);
            return uniqueList(obs.id, obstacle, ...Object.values(this.getObstacles(obstacle)));
        });
    }

    getObstacles(id, strict = false) {
        const ids = this.getNeighbours({ id });
        return Object.entries(ids)
            .filter(([direction]) => {
                if (!strict) {
                    return direction.includes(this.direction);
                }
                return direction === this.direction;
            })
            .reduce((acc, [key, value]) => ((acc[key] = value), acc), {});
    }

    computeIds(ids) {
        const indexes = Array.from({ length: this.area - 1 }, (_, i) => i);
        return indexes.reduce((acc) => acc.flatMap((id) => this.getNeighbours({ id, flat: true })), ids);
    }

    getNeighbours({ id, index = 1, flat = false }) {
        const neighbours = {
            top_right: id - index * this.size + index - this.getThreshold(id),
            right: id + index,
            bottom_right: id + index * this.size + index - this.getThreshold(id),
            bottom_left: id + index * this.size - this.getThreshold(id),
            left: id - index,
            top_left: id - index * this.size - this.getThreshold(id)
        };
        return flat ? flatten(neighbours) : neighbours;
    }

    getTarget(id, index) {
        return this.getNeighbours({ id, index })[this.direction];
    }

    getThreshold(id) {
        const item = this.map.content.find((it) => it.id === id);
        return item.y % 2 === 0 ? 0 : 1;
    }

    getTargets() {
        const linear = ['left', 'right'].includes(this.direction);
        return {
            target: this.getTarget(this.item.id - (linear ? 0 : 2), this.area + 2),
            secondary: this.getTarget(this.item.id - (linear ? 0 : 1), this.area)
        };
    }
}

class Obstacles {
    constructor({ obstacles, filterIds }) {
        this.filterIds = filterIds;
        this.obstacles = this.filterObstacles(obstacles);
        this.contiguousObstacles = this.groupContiguousObstacles();
        this.isolatedObstacles = this.filterIsolatedObstacles();
    }

    filterObstacles(obstacles) {
        return obstacles.filter((it) => !this.filterIds || this.filterIds.includes(it.id)).sort((a, b) => a.id - b.id);
    }

    groupContiguousObstacles() {
        if (!this.obstacles?.length) {
            return [];
        }

        const result = [];
        let currentSuite = [this.obstacles[0]];

        for (let i = 1; i < this.obstacles.length; i++) {
            const item = this.obstacles[i];
            if (item.id === this.obstacles[i - 1].id + 1) {
                currentSuite.push(item);
            } else {
                if (currentSuite.length > 1) {
                    result.push(currentSuite);
                }
                currentSuite = [item];
            }
        }

        if (currentSuite.length > 1) {
            result.push(currentSuite);
        }

        return result;
    }

    filterIsolatedObstacles() {
        const contiguousIds = this.contiguousObstacles.flatMap((it) => it).map((it) => it.id);
        return this.obstacles.filter((it) => !contiguousIds.includes(it.id));
    }
}
