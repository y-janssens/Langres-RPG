import { MapAssets } from '.';

const SPEED = 5;
export default class KeyControls {
    constructor() {
        this.allowedKeys = [
            { name: 'menu', key: 'Escape', value: false },
            { name: 'character', key: 'c', value: false },
            { name: 'quests', key: 'j', value: false },
            { name: 'achievements', key: 'l', value: false },
            { name: 'statistics', key: 'k', value: false },
            // { name: 'minimap', key: 'l', value: true },
            { name: 'interface', key: 'h', value: true },
            { name: 'map', key: 'm', value: false },
            { name: 'pause', key: 'p', value: false }
        ];
        this.assets = new MapAssets();
        this.toggles = {};
        this.positions = [];
        this.pause = false;
        this.generateControls();
        this.directions = { up: false, down: false, left: false, right: false };
        this.currentTile = null;
        this.camera = { x: 0, z: 0 };
        this.speed = 5;
        this.delta = 1.5;
        if (!KeyControls.instance) {
            KeyControls.instance = this;
        }
        return KeyControls.instance;
    }

    generateControls() {
        let _toggles = {};
        this.allowedKeys.forEach((key) => {
            _toggles[key.name] = key.value;
        });
        this.toggles = _toggles;
    }

    setToggles(event) {
        const key = this.allowedKeys.find((k) => k.key === event.key);
        let toggles = { ...this.toggles };

        if (key) {
            if (key.name !== 'pause' && !this.toggles['pause']) {
                this.allowedKeys.forEach((key) => {
                    toggles[key.name] = key.value;
                });
                toggles[key.name] = !this.toggles[key.name];
            }

            if (
                key.name === 'pause' &&
                Object.entries(this.toggles)
                    .filter((k) => k[0] !== 'interface' && k[0] !== 'pause' && k[0] !== 'minimap')
                    .every((k) => k[1] === false)
            ) {
                toggles['pause'] = !this.toggles['pause'];
            }
            this.toggles = toggles;
        }
    }

    getKey(event) {
        switch (event.key) {
            case 'z':
            case 'ArrowUp':
                return 'up';
            case 's':
            case 'ArrowDown':
                return 'down';
            case 'q':
            case 'ArrowLeft':
                return 'left';
            case 'd':
            case 'ArrowRight':
                return 'right';
            default:
                return;
        }
    }

    setPosition(position) {
        const positions = [position.x, 0.75, position.z];
        this.positions = positions;
    }

    handle_pause(event) {
        if (event.key === 'Escape') {
            const pause = !this.pause;
            this.pause = pause;
        }
    }

    setDirections(event, value) {
        const key = this.getKey(event);
        if (key) {
            this.directions[key] = value;
        }
        const speed = event.ctrlKey ? 2 : SPEED;
        this.speed = speed;
    }

    setCamera(camera) {
        const positions = { x: camera.x, z: camera.z };
        this.camera = positions;
    }

    getDelta(position) {
        return Math.hypot(position.x - this.camera.x, position.z - this.camera.z) > this.delta;
    }

    get isMoving() {
        return Object.values(this.directions).some((key) => key === true);
    }

    rayCasterResolver({ positionCaster, collisionCaster, scene }) {
        const current = positionCaster.intersectObjects(scene.children).find((it) => it.object.userData.castable)?.object.userData?.tile;
        const next = collisionCaster.intersectObjects(scene.children).find((it) => it.object.userData.castable)?.object.userData?.tile;
        this.currentTile = current;
        return {
            current: current,
            next: next,
            canMove: Boolean(current?.walkable && next)
        };
    }

    filterItems() {
        const id = this.currentTile.id;
        const height = Math.ceil(Math.ceil(window.innerHeight / 100) * Math.sqrt(3));
        const width = Math.ceil(Math.ceil(window.innerWidth / 100) * Math.sqrt(3));
        const rationalizedIds = new Rationalizer(id, width, height).resolve();

        return this.items.filter((it) => rationalizedIds.includes(it.id));

        // Backend culling
        // await invoke('frustum_cull_ids', { value: id, size: 50, horizontal: width, vertical: height }).then((response) => {
        //     items = this.items.filter((it) => response.includes(it.id));
        // });
        // return items;
    }
}

export class Rationalizer {
    constructor(value, horizontalThreshold, verticalThreshold) {
        this.value = value;
        this.horizontalThreshold = horizontalThreshold;
        this.verticalThreshold = verticalThreshold || horizontalThreshold;
        this.verticalBias = this.verticalThreshold / 1.5;
    }

    get verticalIds() {
        let ids = [this.value];
        for (let i = 0; i < this.verticalBias; i++) {
            ids.push(Math.abs(-this.value + i * 50));
        }

        for (let i = 0; i < this.verticalThreshold - this.verticalBias + 1; i++) {
            ids.push(this.value + i * 50);
        }
        return Array.from(new Set(ids.sort()));
    }

    get horizontalIds() {
        return Array.from(
            new Set(
                this.verticalIds
                    .map((id) => {
                        let ids = [];
                        for (let i = 0; i < this.horizontalThreshold; i++) {
                            ids.push(id + i);
                            ids.push(Math.abs(-id + i));
                        }
                        return ids;
                    })
                    .sort()
            )
        );
    }

    resolve() {
        return Array.from(new Set(this.horizontalIds.flat()));
    }
}
