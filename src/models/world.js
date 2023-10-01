import { invoke } from '@tauri-apps/api/tauri';
import MapAssets from './map';
export default class World {
    constructor({ width, height, content }) {
        this.width = width;
        this.height = height;
        this.grid = this.gridify(content);
        this.content = content;
    }

    parse() {
        let content = this.content;
        let size = this.width;
        return Array.from({ length: Math.ceil(content.length / size) }, (_, index) => content.slice(index * size, (index + 1) * size));
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
        const width = this.width;
        return Array.from({ length: Math.ceil(values.length / width) }, (_, index) => values.slice(index * width, (index + 1) * width));
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
