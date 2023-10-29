import { invoke } from '@tauri-apps/api/tauri';
import MapAssets from './map';
export default class World {
    constructor({ size, content, order, complete }) {
        this.size = size;
        this.order = order;
        this.grid = this.gridify(content);
        this.complete = complete;
        this.content = content;
    }

    parse() {
        let content = this.content;
        return Array.from({ length: Math.ceil(content.length / this.size) }, (_, index) => content.slice(index * this.size, (index + 1) * this.size));
    }

    extend(map) {
        let fullMap = map.map((row) => {
            for (let i = 0; i < 5; i++) {
                row.push(row[0]);
                row.unshift(row[row.length - 1]);
            }
            return row;
        });

        for (let i = 0; i < 5; i++) {
            fullMap.push(fullMap[0]);
            fullMap.unshift(fullMap[0]);
        }
        return fullMap;
    }

    gridify(data) {
        const autorisedKeys = new Set(new MapAssets().validKeys);
        const values = data.map((item) => (autorisedKeys.has(item.value) ? 0 : 1));
        return Array.from({ length: Math.ceil(values.length / this.size) }, (_, index) => values.slice(index * this.size, (index + 1) * this.size));
    }

    // pick_starting_point(game) {
    //   if (
    //     !("last_known_position" in game) ||
    //     game.last_known_position === [0, 0, 0]
    //   ) {
    //     let start = this.content.filter((it) => it.value === "-")[
    //       Math.floor(Math.random() * this.content.length)
    //     ];
    //     return [start.x, 15, start.y];
    //   }
    //   return game.last_known_position;
    // }

    async regenerate(data) {
        await invoke('regenerate', { data });
    }
}
