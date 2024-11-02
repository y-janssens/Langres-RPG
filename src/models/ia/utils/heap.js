export default class Heap {
    constructor(cmp) {
        this.cmp = cmp || this.defaultCmp();
        this.nodes = [];
    }

    get isEmpty() {
        return this.nodes.length === 0;
    }

    defaultCmp(x, y) {
        return x - y;
    }

    push(item) {
        this.nodes.push(item);
        this.shiftDown(this.nodes, 0, this.nodes.length - 1, this.cmp);
    }

    pop() {
        const lastElt = this.nodes.pop();
        if (this.nodes.length) {
            const returnItem = this.nodes[0];
            this.nodes[0] = lastElt;
            this.shiftUp(this.nodes, 0, this.cmp);
            return returnItem;
        } else {
            return lastElt;
        }
    }

    updateItem(item) {
        const pos = this.nodes.indexOf(item);
        if (pos === -1) return;
        this.shiftDown(this.nodes, 0, pos, this.cmp);
        this.shiftUp(this.nodes, pos, this.cmp);
    }

    shiftDown(array, startPos, pos, cmp) {
        const newItem = array[pos];
        while (pos > startPos) {
            const parentPos = (pos - 1) >> 1;
            const parent = array[parentPos];
            if (cmp(newItem, parent) < 0) {
                array[pos] = parent;
                pos = parentPos;
            } else {
                break;
            }
        }
        array[pos] = newItem;
    }

    shiftUp(array, pos, cmp) {
        const endPos = array.length;
        const startPos = pos;
        const newItem = array[pos];
        let childPos = 2 * pos + 1;

        while (childPos < endPos) {
            const rightPos = childPos + 1;
            if (rightPos < endPos && !(cmp(array[childPos], array[rightPos]) < 0)) {
                childPos = rightPos;
            }
            array[pos] = array[childPos];
            pos = childPos;
            childPos = 2 * pos + 1;
        }
        array[pos] = newItem;
        this.shiftDown(array, startPos, pos, cmp);
    }
}
