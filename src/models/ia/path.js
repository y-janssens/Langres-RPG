import Grid from './grid';
import AStarFinder from './astar';
import _ from 'lodash';

export default class PathFinder {
    constructor({ map, obstacles = [] }) {
        this.map = map;
        this.obstacles = this.get_obstacles(obstacles);
        this.grid = this.get_grid();
    }

    /**
     * Find shortest path and return a list of items, filtered for false positives
     */
    find_path(start, dest) {
        let nodes = this.grid.clone();

        return new AStarFinder()
            .findPath(start.x, start.y, dest.x, dest.y, nodes)
            .map((step) => this.get_item(step))
            .filter(Boolean);
    }

    /**
     * Reduce map to a matrix of nodes
     */
    get_grid() {
        const values = this.map.content.map((item) => {
            return {
                walkable: Boolean(!item.walkable || this.obstacles.includes(item.id) ? 0 : 1),
                orig: { x: item.x, y: item.y },
                id: item.id
            };
        });
        return new Grid(_.chunk(values, this.map.size));
    }

    /**
     * Avoid relying on coordinates and get item by it's ID
     */
    get_item(values) {
        const { x, y, id } = this.map.content.find((it) => it.id === values.id);
        return { x, y, id, visited: false };
    }

    /**
     * Testing feature, aggregate both natural and user induced obstacles
     */
    get_obstacles(obstacles) {
        return Array.from(new Set([...this.map.content.filter((it) => !it.walkable).map((it) => it.id), ...obstacles]));
    }
}
