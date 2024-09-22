import { Heap, Heuristic } from './utils';

export default class AStarFinder {
    constructor() {
        this.heuristic = Heuristic.manhattan;
    }

    findPath(startX, startY, endX, endY, grid) {
        const openList = new Heap((nodeA, nodeB) => nodeA.f - nodeB.f);
        let startNode = grid.getDefaultValues(startX, startY);
        let endNode = grid.getDefaultValues(endX, endY);

        openList.push(startNode);
        startNode.g = 0;
        startNode.f = 0;
        startNode.opened = true;

        while (!openList.isEmpty) {
            // pop the position of node which has the minimum `f` value.
            const node = openList.pop();
            node.closed = true;

            // if reached the end position, construct the path and return it
            if (node === endNode) {
                return this.backtrace(endNode);
            }

            // get current node's neighbours
            grid.getNeighbors(node).forEach((neighbor) => {
                const { x, y } = neighbor;

                // get the distance between current node and the neighbor and calculate the next g score
                const ng = node.g + (x - node.x === 0 || y - node.y === 0 ? 1 : Math.SQRT2);

                // check if the neighbor has not been inspected yet, or if it can be reached with smaller cost from the current node
                if (!neighbor.opened || ng < neighbor.g) {
                    neighbor.g = ng;
                    neighbor.h = neighbor.h || this.heuristic(Math.abs(x - endX), Math.abs(y - endY));
                    neighbor.f = neighbor.g + neighbor.h;
                    neighbor.parent = node;

                    if (!neighbor.opened) {
                        openList.push(neighbor);
                        neighbor.opened = true;
                    } else {
                        // the neighbor can be reached with smaller cost, update its position in the open list
                        openList.updateItem(neighbor);
                    }
                }
            });
        }
        // failed to find a path
        return [];
    }

    /**
     * Build final path, from end to start
     */
    backtrace(node) {
        let path = [node.output];
        while (node.parent) {
            node = node.parent;
            path.push(node.output);
        }
        return path.reverse();
    }
}
