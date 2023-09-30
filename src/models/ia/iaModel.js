export default class IA {
    constructor({ type, target, map, self, allowedKeys }) {
        this.target = target;
        this.type = type;
        this.map = map;
        this.self = self;
        this.allowedKeys = allowedKeys;
        this.patrolRange = 5;
        this.patrolling = true;
        this.position = null;
        this.startingPosition = null;
        this.targetPosition = null;
        this.acknowledge = false;
        this.aggroRange = 5;
        this.init();
    }

    init() {
        this.position = { x: this.self.current.position.x, y: this.self.current.position.z };
        this.startingPosition = { x: this.self.current.position.x, y: this.self.current.position.z };
        this.targetPosition = { x: this.target.current.position.x, y: this.target.current.position.z };
        this.aggro();
    }

    update(data) {
        this.targetPosition = { x: data.x, y: data.z };
        this.aggro();
    }

    aggro() {
        const x = Math.abs(this.position.x - this.targetPosition.x);
        const y = Math.abs(this.position.y - this.targetPosition.y);

        if (x <= this.aggroRange && y <= this.aggroRange) {
            return (this.patrolling = false), (this.acknowledge = true);
        }
        return (this.patrolling = true), (this.acknowledge = false);
    }

    patrol() {
        this.aggro();
        if (this.patrolling) {
            const x = this.get_position();
            const y = this.get_position();

            const nextPosition = { x: this.position.x + x, y: this.position.y + y };
            const nextItem = this.map.content.find((it) => it.x === nextPosition.x && it.y === nextPosition.y);

            if (
                nextPosition.x <= this.startingPosition.x + this.patrolRange &&
                nextPosition.y <= this.startingPosition.y + this.patrolRange &&
                Math.abs(x) !== Math.abs(y) &&
                this.allowedKeys.includes(nextItem.value)
            ) {
                this.position = nextPosition;
            } else {
                this.patrol();
            }
        }
    }

    get_position() {
        const moves = [+1, -1, 0];
        return moves[Math.floor(Math.random() * moves.length)];
    }

    find_path() {
        let nextPosition = { ...this.position };
        const yDiff = Math.abs(this.position.y - this.targetPosition.y);
        const xDiff = Math.abs(this.position.x - this.targetPosition.x);

        if (yDiff > xDiff) {
            nextPosition = { x: this.position.x, y: this.targetPosition.y > this.position.y ? this.targetPosition.y + 1 : this.targetPosition.y - 1 };
        } else {
            nextPosition = { x: this.targetPosition.x > this.position.x ? this.position.x + 1 : this.position.x - 1, y: this.position.y };
        }

        if (nextPosition.x < this.targetPosition.x || nextPosition.y < this.targetPosition.y || nextPosition.x > this.targetPosition.x || nextPosition.y > this.targetPosition.y) {
            this.position = nextPosition;
        }
    }
}
