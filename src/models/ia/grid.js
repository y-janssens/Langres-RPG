import Node from './node';
import { cloneDeep } from 'lodash';

export default class Grid {
    constructor(nodes) {
        this.width = nodes[0].length;
        this.height = nodes.length;
        this.nodes = this.buildNodes(nodes);
    }

    // Build nodes from boolean matrix
    buildNodes(matrix) {
        return matrix.map((row, y) =>
            row.map(
                (it, x) =>
                    new Node({
                        x,
                        y,
                        size: this.width,
                        ...it
                    })
            )
        );
    }

    getDefaultValues(x, y) {
        const _x = Math.ceil(y % 2 === 0 ? x / 2 - 1 : x / 2);
        return this.getNodeAt(_x, y);
    }

    getNodeAt(x, y) {
        return this.nodes[y][x];
    }

    isWalkableAt(x, y) {
        return this.isInside(x, y) && this.nodes[y][x].walkable;
    }

    /**
     * Avoid looking for nodes outside map's boundaries
     */
    isInside(x, y) {
        return x >= 0 && x < this.width && y >= 0 && y < this.height;
    }

    /**
     * Get node's neighbours with each direction's coordinates
     */
    getNeighbors(node) {
        let neighbors = [];

        // ↖
        this.checkNeighbour(neighbors, ...node.getCoordinates('top_left'));
        // ↗
        this.checkNeighbour(neighbors, ...node.getCoordinates('top_right'));
        // ←
        this.checkNeighbour(neighbors, ...node.getCoordinates('left'));
        // →
        this.checkNeighbour(neighbors, ...node.getCoordinates('right'));
        // ↙
        this.checkNeighbour(neighbors, ...node.getCoordinates('bottom_left'));
        // ↘
        this.checkNeighbour(neighbors, ...node.getCoordinates('bottom_right'));

        return neighbors;
    }

    /**
     * Check if neighbour is walkable and retrieve node if so
     */
    checkNeighbour(neighbours, x, y) {
        if (this.isWalkableAt(x, y)) {
            return neighbours.push(this.nodes[y][x]);
        }
    }

    /**
     * Each grid can only be used once, a deep copy is mandatory before use to avoid corrupting the source
     */
    clone() {
        return cloneDeep(this);
    }
}
