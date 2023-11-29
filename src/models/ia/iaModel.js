import { AStarFinder, Grid } from 'pathfinding';

export default class IA {
    constructor({ type, target, map, nodes, self }) {
        this.target = target;
        this.type = type;
        this.map = map;
        this.nodes = new Grid(nodes);
        this.self = self;
        this.patrolRange = 5;
        this.patrolling = true;
        this.position = null;
        this.startingPosition = null;
        this.lastKnownPosition = null;
        this.targetPosition = null;
        this.pathFinder = new Path({ grid: this.nodes });
        this.patrolPath = [];
        this.aggroPath = [];
        this.direction = 'down';
        this.acknowledged = false;
        this.init();
    }

    init() {
        this.position = { x: this.self.current.position.x, y: this.self.current.position.z };
        this.startingPosition = { x: this.self.current.position.x, y: this.self.current.position.z };
        this.targetPosition = { x: this.target.current.position.x, y: this.target.current.position.z };
    }

    update(data) {
        this.targetPosition = { x: data.x, y: data.z };
        // const aggroRange = this.get_detection_field(this.direction);
        // if (aggroRange.some((it) => it.x === this.targetPosition.x && it.y === this.targetPosition.y)) {
        //     this.patrolling = false;
        //     this.acknowledged = true;
        //     if (this.patrolPath.length) {
        //         this.patrolPath = [];
        //     }
        //     this.aggro();
        // } else {
        //     this.patrolling = true;
        //     this.acknowledged = false;
        //     if (this.aggroPath.length) {
        //         this.aggroPath = [];
        //     }
        //     this.patrol();
        // }
    }

    get_detection_field(direction) {
        const currentItem = this.map.content.find((it) => it.x === this.position.x && it.y === this.position.y);
        // const largeIds = this.get_items(currentItem.id);
        const baseIds = [0, +1, -1, +50, +51, +49, -50, -51, -49];
        const directionIds = {
            up: [+98, +99, +100, +101, +102, +148, +149, +150, +151, +152],
            down: [-98, -99, -100, -101, -102, -148, -149, -150, -151, -152],
            left: [+2, +3, -48, +52, +53, +103, +102, -47, -97, -98],
            right: [-2, -3, +48, -52, -53, -103, -102, +47, +97, +98]
        };
        const ids = baseIds.concat(directionIds[direction]);

        return this.map.content.filter((it) => {
            const idDiff = it.id - currentItem.id;
            return ids.includes(idDiff);
        });
    }

    get_items(item) {
        const ids = [+50, +100, +150, +200, -50, -100, -150, -200];
        const offsets = [-51, -50, -49, -1, 0, 1, 49, 50, 51];

        return offsets
            .map((offset) => {
                return ids.map((id) => item + id + offset);
            })
            .flat();
    }

    aggro() {
        if (this.acknowledged) {
            if (!this.aggroPath?.length || this.aggroPath?.every((it) => Boolean(it.visited))) {
                const destination = { x: this.targetPosition.x, y: this.targetPosition.y };
                this.aggroPath = this.pathFinder.find_path(this.position, destination);
            }
            if (this.aggroPath?.length && this.aggroPath?.some((it) => !it.visited)) {
                const nextItem = this.aggroPath.find((it) => !it.visited);
                const nextPosition = { x: nextItem.x, y: nextItem.y };

                this.direction = this.get_direction(nextPosition, this.position);

                if (this.aggroPath.indexOf(nextItem) < this.aggroPath.length - 1) {
                    this.position = nextPosition;
                }
                nextItem.visited = true;
            }
        }
    }

    patrol() {
        if (this.patrolling) {
            if (!this.patrolPath?.length || this.patrolPath?.every((it) => Boolean(it.visited))) {
                const destination = { x: Math.min(this.startingPosition.x + this.get_position()), y: Math.min(this.startingPosition.y + this.get_position()) };
                this.patrolPath = this.pathFinder.find_path(this.position, destination);
            }
            if (this.patrolPath?.length && this.patrolPath?.some((it) => !it.visited)) {
                const nextItem = this.patrolPath.find((it) => !it.visited);
                const nextPosition = { x: nextItem.x, y: nextItem.y };

                this.direction = this.get_direction(nextPosition, this.position);
                this.position = nextPosition;
                nextItem.visited = true;
            }
        }
    }

    get_direction(position, previousPosition) {
        if (position.x > previousPosition.x) {
            return 'left';
        }
        if (position.x < previousPosition.x) {
            return 'right';
        }
        if (position.y > previousPosition.y) {
            return 'up';
        }
        if (position.y < previousPosition.y) {
            return 'down';
        }
        return this.direction;
    }

    get_position() {
        return Math.floor(Math.random() * this.patrolRange);
    }
}

class Path {
    constructor({ grid }) {
        this.grid = grid;
    }

    find_path(start, dest) {
        let nodes = this.grid.clone();
        return new AStarFinder().findPath(start.x, start.y, dest.x, dest.y, nodes).map((step) => {
            return { x: step[0], y: step[1], visited: false };
        });
    }
}
