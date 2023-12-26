import MapAssets from '../models/map';

export default class KeyControls {
    constructor() {
        this.allowedKeys = [
            { name: 'menu', key: 'Escape', value: false },
            { name: 'character', key: 'c', value: false },
            { name: 'minimap', key: 'l', value: true },
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
        this.camera = { x: 0, z: 0 };
        this.SPEED = 5;
        this.speed = 5;
        this.delta = 1.5;
        this.threshold = 0.5;
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
            if ((key.name !== 'pause' && !this.toggles['pause'] && !this.toggles['input']) || (key.name === 'input' && Boolean(this.toggles['input']))) {
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
        const directions = this.directions;
        const key = this.getKey(event);
        if (key) {
            directions[key] = value;
            this.directions = directions;
        }
        const speed = event.ctrlKey ? 2 : this.SPEED;
        this.speed = speed;
    }

    setCamera(camera) {
        const positions = { x: camera.x, z: camera.z };
        this.camera = positions;
    }

    getDelta(position) {
        return Math.hypot(position.x - this.camera.x, position.z - this.camera.z) > this.delta;
    }

    get moving() {
        return Object.values(this.directions).some((key) => Boolean(key));
    }
}
