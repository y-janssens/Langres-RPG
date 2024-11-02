import { v4 as uuid } from 'uuid';

export default class Tree {
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
        const nodes = Object.entries(data).map(([key, value]) => ({ [key]: new TreeNode(value) }));
        return new Tree(nodes.reduce((acc, node) => Object.assign(acc, node), {}));
    }
}

class TreeNode {
    constructor({ priority, action, conditions, children = [], delay }) {
        this.id = uuid();
        this.priority = priority;
        this.action = action;
        this.conditions = conditions;
        this.children = children.map((ch) => new TreeNode(ch));
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
