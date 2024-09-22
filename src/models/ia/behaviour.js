import { Rationalizer } from '../controls';
import PathFinder from './path';
import { Logs } from './utils';
import Tree from './tree';

class Function {
    default() {
        return; // Does nothing, as any good default function would do
    }

    idle() {
        return; // Does nothing and wait forever
    }

    patrol() {
        if (!this.patrolPath?.length || this.patrolPath?.every((it) => Boolean(it.visited))) {
            const destination = { x: Math.min(this.startingPosition.x + this.get_position()), y: Math.min(this.startingPosition.y + this.get_position()) };
            this.patrolPath = this.pathFinder.find_path(this.position, destination);
        }
        if (this.patrolPath?.length && this.patrolPath?.some((it) => !it.visited)) {
            this.move('patrolPath');
        }
    }

    aggro() {
        if (!this.aggroPath?.length || this.aggroPath?.every((it) => Boolean(it.visited))) {
            let path = this.pathFinder.find_path(this.position, this.targetPosition);
            path.pop();
            this.aggroPath = path;
        }
        if (this.aggroPath?.length && this.aggroPath?.some((it) => !it.visited)) {
            this.move('aggroPath');
        }
    }

    freeze() {
        // TODO implement
    }

    resume() {
        // Return to starting point
    }

    move(key) {
        const nextItem = this[key].find((it) => !it.visited);
        const nextPosition = { x: nextItem.x, y: nextItem.y };
        this.direction = this.get_direction(nextPosition, this.position);
        this.position = nextPosition;
        nextItem.visited = true;
    }
}

class Conditions extends Function {
    idleConditions() {
        return [() => this.static, () => !this.hasAggroRange(), () => !this.hasMildAggroRange()];
    }

    patrolConditions() {
        return [() => !this.static, () => !this.hasAggroRange(), () => !this.hasMildAggroRange()];
    }

    aggroConditions() {
        return [() => this.hostile, () => this.hasAggroRange(), () => this.hasMildAggroRange()];
    }

    freezeConditions() {
        return [() => !this.hasAggroRange(), () => this.hasMildAggroRange(), () => this.previousStance !== 'resume'];
    }

    resumeConditions() {
        return [() => this.previousStance === 'aggro'];
    }

    hasAggroRange() {
        return this.aggroIds.includes(this.targetPosition.id);
    }

    hasMildAggroRange() {
        return this.largeAggroIds.includes(this.targetPosition.id);
    }
}

export default class NpcBehaviourTree extends Conditions {
    constructor({ target, self, map, verbose = false, targetPosition }) {
        super();
        this.id = self.current.uuid;
        this.obj = self.current.userData;
        this.target = target;
        this.map = map;
        this.aggroRange = 5;
        this.patrolRange = 3;
        this.aggroIds = [];
        this.verbose = verbose;
        this.position = { x: self.current.position.x, y: self.current.position.z };
        this.startingPosition = { x: self.current.position.x, y: self.current.position.z };
        this.targetPosition = targetPosition;
        this.pathFinder = new PathFinder({ map });
        this.static = true;
        this.hostile = true;
        // this.static = self.current?.userData?.static;
        // this.hostile = self.current?.userData?.hostile;
        this.logs = new Logs({ instance: this.id, map });
        this.patrolPath = [];
        this.aggroPath = [];
        this.resumePath = [];
        this.direction = { x: Math.PI / 2, y: Math.PI / 2 };
        this.tree = Tree.generate({
            idle: {
                priority: 1,
                action: 'idle',
                conditions: this.idleConditions(),
                children: [],
                delay: null
            },
            patrol: {
                priority: 1,
                action: 'patrol',
                conditions: this.patrolConditions(),
                children: [],
                delay: null
            },
            aggro: {
                priority: 2,
                action: 'aggro',
                conditions: this.aggroConditions(),
                children: [],
                delay: null
            },
            freeze: {
                priority: 3,
                action: 'freeze',
                conditions: this.freezeConditions(),
                children: [
                    {
                        priority: 1,
                        action: 'resume',
                        conditions: this.resumeConditions(),
                        children: [],
                        delay: null
                    }
                ],
                delay: null
            }
        });
    }

    // Core Behaviour tree methods

    outputStance(stance) {
        if (!this.verbose || this.stance === this.previousStance) {
            return;
        }
        const name = `${this.obj.first_name} ${this.obj.last_name}`;
        console.log(`${name}: ${stance || this.stance} \n position: x: ${this.position.x}, y: ${this.position.y}`);
    }

    update({ target }) {
        this.updatePosition(target);
        [this.aggroIds, this.largeAggroIds] = this.get_detection_field();
        this.resolveAction();
        this.updateLogs();
    }

    updateLogs() {
        if (this.previousStance === this.stance) {
            return;
        }

        this.logs.update({
            current: this.stance,
            previous: this.previousStance,
            player: this.targetPosition,
            position: this.position,
            npc: this.obj
        });
    }

    get_function(name) {
        if (!name) {
            return this.default();
        }

        this.previousStance = this.stance;
        this.stance = name;
        this.outputStance(name);
        return this[name]();
    }

    resolveAction(stance) {
        try {
            const node = stance ? this.tree[stance] : this.tree.get_node();
            return this.get_function(node.action);
        } catch {
            return this.get_function();
        }
    }

    // Detection logic

    get_detection_field() {
        if (!this.position) {
            return;
        }

        const currentItem = this.map.content.find((it) => it.x === this.position.x && it.y === this.position.y);
        const ids = new Rationalizer(currentItem.id, this.aggroRange).resolve();
        const largeIds = new Rationalizer(currentItem.id, this.aggroRange + 2).resolve();
        return [ids, largeIds];
    }

    updatePosition(target) {
        if (!target) {
            return;
        }
        this.targetPosition = target;
    }

    get_position() {
        return Math.floor(Math.random() * this.patrolRange);
    }

    get_direction(position, previousPosition) {
        if (position.x < previousPosition.x && position.y > previousPosition.y) {
            return { x: Math.PI / 2, y: (-3 * Math.PI) / 4 };
        }
        if (position.x > previousPosition.x && position.y > previousPosition.y) {
            return { x: Math.PI / 2, y: (3 * Math.PI) / 4 };
        }
        if (position.x < previousPosition.x && position.y === previousPosition.y) {
            return { x: Math.PI / 2, y: -Math.PI / 2 };
        }
        if (position.x > previousPosition.x && position.y === previousPosition.y) {
            return { x: Math.PI / 2, y: Math.PI / 2 };
        }
        if (position.x < previousPosition.x && position.y < previousPosition.y) {
            return { x: Math.PI / 2, y: -Math.PI / 4 };
        }
        if (position.x > previousPosition.x && position.y < previousPosition.y) {
            return { x: Math.PI / 2, y: Math.PI / 4 };
        }
        return this.direction;
    }
}
