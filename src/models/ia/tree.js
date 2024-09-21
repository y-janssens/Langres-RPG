import { v4 as uuid } from 'uuid';
import { Rationalizer } from '../controls';

class Function {
    default() {
        return; // Does nothing, as any good default function would do
    }

    idle() {
        // TODO implement
    }

    patrol() {
        // TODO implement
    }

    aggro() {
        // TODO implement
    }

    freeze() {
        // TODO implement
    }

    resume() {
        // Return to starting point
        // return this.get_function('patrol');
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
        return [() => this.hasAggroRange(), () => this.hasMildAggroRange()];
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

export default class NpcBehaviour extends Conditions {
    constructor({ target, self, map, nodes, patrol = true, verbose = false, targetPosition }) {
        super();
        this.target = target;
        this.self = self;
        this.map = map;
        this.nodes = nodes;
        this.aggroRange = 3;
        this.aggroIds = [];
        this.verbose = verbose;
        this.position = { x: self.current.position.x, y: self.current.position.z };
        this.startingPosition = { x: self.current.position.x, y: self.current.position.z };
        this.targetPosition = targetPosition;
        this.static = !patrol;
        this.logs = [];
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
        if (!this.verbose) {
            return;
        }
        console.log(stance || this.stance);
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
        let logs = [...this.logs];

        if (logs.length === 10) {
            logs.splice(0, 1);
        }

        logs.push(
            new Log({
                current: this.stance,
                previous: this.previousStance,
                npc: this.map.content.find((it) => it.x === this.position.x && it.y === this.position.y),
                player: this.targetPosition,
                map: this.map
            })
        );
        this.logs = logs;
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

        const ids = new Rationalizer(currentItem.id, this.aggroRange, this.aggroRange).resolve();
        const largeIds = new Rationalizer(currentItem.id, this.aggroRange + 2, this.aggroRange + 2).resolve();
        return [ids, largeIds];
    }

    updatePosition(target) {
        if (!target) {
            return;
        }
        this.targetPosition = target;
    }
}

class Tree {
    constructor(options = {}) {
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    get_node() {
        return Object.entries(this)
            .filter(([, value]) => value.validate())
            .sort(([, a], [, b]) => a.priority - b.priority)
            .find(([, value]) => value)?.[1]
            .inspect();
    }

    static generate(data) {
        const nodes = Object.entries(data).map(([key, value]) => ({ [key]: new Node(value) }));
        return new Tree(nodes.reduce((acc, node) => Object.assign(acc, node), {}));
    }
}

class Node {
    constructor({ priority, action, conditions, children = [], delay }) {
        this.id = uuid();
        this.priority = priority;
        this.action = action;
        this.conditions = conditions;
        this.children = children.map((ch) => new Node(ch));
        this.delay = delay;
    }

    validate() {
        if (!this.conditions.length) {
            return true;
        }

        return this.conditions.every((cdn) => cdn());
    }

    inspect() {
        if (!this.children.some((ch) => ch.validate())) {
            return this;
        }

        return this.findNode();
    }

    findNode() {
        return this.children
            .filter((it) => it.validate())
            .sort((a, b) => a.priority - b.priority)
            .find(Boolean)
            .inspect();
    }
}

class Log {
    constructor({ current, previous, npc, player, map: { id, name, primary, complete } }) {
        this.date = new Date().toISOString();
        this.state = { current, previous };
        this.npc = npc;
        this.player = player;
        this.map = { id, name, primary, complete };
    }
}
