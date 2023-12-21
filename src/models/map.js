import { useLoader } from '@react-three/fiber';
import { TextureLoader } from 'three';

export default class MapAssets {
    constructor() {
        this.assets = [
            {
                name: 'border',
                key: 'F',
                src: [
                    './assets/map/trees/1.png',
                    './assets/map/trees/2.png',
                    './assets/map/trees/3.png',
                    './assets/map/trees/3.png',
                    './assets/map/trees/5.png',
                    './assets/map/trees/6.png',
                    './assets/map/trees/7.png',
                    './assets/map/trees/8.png',
                    './assets/map/trees/9.png',
                    './assets/map/trees/10.png',
                    './assets/map/trees/11.png',
                    './assets/map/trees/12.png',
                    './assets/map/trees/13.png',
                    './assets/map/trees/14.png'
                ],
                color: 'darkGreen'
            },
            {
                name: 'tree',
                key: 'T',
                src: [
                    './assets/map/trees/1.png',
                    './assets/map/trees/2.png',
                    './assets/map/trees/3.png',
                    './assets/map/trees/3.png',
                    './assets/map/trees/5.png',
                    './assets/map/trees/6.png',
                    './assets/map/trees/7.png',
                    './assets/map/trees/8.png',
                    './assets/map/trees/9.png',
                    './assets/map/trees/10.png',
                    './assets/map/trees/11.png',
                    './assets/map/trees/12.png',
                    './assets/map/trees/13.png',
                    './assets/map/trees/14.png'
                ],
                color: 'green'
            },
            {
                name: 'grass',
                key: '-',
                src: ['./assets/map/grass/grass-1.jpg', './assets/map/grass/1.png', './assets/map/grass/2.png', './assets/map/grass/3.png'],
                color: '#505050'
            },
            {
                name: 'rock',
                key: 'R',
                src: ['./assets/map/rocks/{}.png', './assets/map/rocks/{}.png', './assets/map/rocks/{}.png'],
                color: 'darkgray'
            },
            {
                name: 'ground',
                key: 'C',
                src: ['./assets/map/grounds/{}.png', './assets/map/grounds/{}.png', './assets/map/grounds/{}.png'],
                color: 'beige'
            },
            {
                name: 'water',
                key: 'W',
                src: ['./assets/map/water/water_b.png', './assets/map/water/water_l.png', './assets/map/water/water_r.png'],
                color: 'blue'
            },
            {
                name: 'bridge',
                key: 'BR',
                src: ['./assets/map/water/{}.png', './assets/map/water/{}.png', './assets/map/water/{}.png'],
                color: 'brown'
            }
        ];
    }

    get_asset(item) {
        const asset = this.assets.find((as) => as.key === item.value);
        return asset.src[Math.floor(Math.random() * asset.src.length)];
    }

    get_grass() {
        const asset = this.assets.find((as) => as.key === '-');
        return useLoader(TextureLoader, asset.src[0]);
    }

    get_trees(data) {
        let items = [];
        data.forEach((item) => {
            if (item.value === 'T' || item.value === 'F') {
                items.push({
                    id: item.id,
                    map: useLoader(TextureLoader, this.get_asset(item))
                });
            }
        });
        return items;
    }

    get_water() {
        const asset = this.assets.find((as) => as.key === 'W');
        return useLoader(TextureLoader, asset.src[0]);
        // let items = [];
        // data.forEach((row) => {
        //     const riverRow = row.filter((it) => it.value === 'W');
        //     if (riverRow.length) {
        //         riverRow[0]['position'] = '_b';
        //         riverRow[1]['position'] = '_l';
        //         riverRow[riverRow.length - 1]['position'] = '_b';
        //         riverRow[riverRow.length - 2]['position'] = '_r';
        //         riverRow.forEach((it) => {
        //             items.push({
        //                 id: it.id,
        //                 map: useLoader(TextureLoader, `./assets/map/water/water${it.position || '_c'}.png`)
        //             });
        //         });
        //     }
        // });
        // return items;
    }

    get_items_ids(item, world) {
        let validIds = [];
        let invalidIds = [];
        let id = item.id;
        const max_index = world.size * world.size;
        const ids = [id, id + 1, id - 1, id + world.size, id - world.size];

        ids.filter((i) => i > 0 && i <= max_index).map((it) => {
            if (!world.content[it].walkable) {
                return invalidIds.push(it);
            }
            return validIds.push(it);
        });

        return { validIds, invalidIds };
    }

    get_color(item) {
        return this.assets.find((k) => k.key === item.value).color;
    }
}
