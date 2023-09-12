import MapAssets from "../models/map";

export default class KeyControls {
  constructor() {
    this.defaultKeys = [
      { name: "menu", key: "Escape", value: false },
      { name: "character", key: "c", value: false },
      { name: "interface", key: "h", value: true },
      { name: "map", key: "m", value: false },
      { name: "inventory", key: "i", value: false }
    ];

    this.allowedKeys = [
      { name: "menu", key: "Escape", value: false },
      { name: "character", key: "c", value: false },
      { name: "interface", key: "h", value: true },
      { name: "map", key: "m", value: false },
      { name: "inventory", key: "i", value: false }
    ];

    this.controlsKeys = [
      { name: "up", key: "z" },
      { name: "up_arrow", key: "ArrowUp" },
      { name: "down", key: "s" },
      { name: "down_arrow", key: "ArrowDown" },
      { name: "left", key: "q" },
      { name: "left_arrow", key: "ArrowLeft" },
      { name: "right", key: "d" },
      { name: "right_arrow", key: "ArrowRight" }
    ];
    this.assets = new MapAssets();
    this.validKeys = this.assets.validKeys;
    this.borderKeys = this.assets.borderKeys;
    this.toggles = {};
    this.positions = [25, 0.75, 25];
    this.generateControls();
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
    if (key) {
      let toggles = {};
      this.allowedKeys.forEach((key) => {
        toggles[key.name] = key.value;
      });
      toggles[key.name] = !this.toggles[key.name];
      this.toggles = toggles;
    }
  }

  getKey(event) {
    let direction = "down";
    const key = this.controlsKeys.find((k) => k.key === event.key);
    if (key) {
      switch (event.key) {
        case "z":
        case "ArrowUp":
          direction = "up";
          break;
        case "s":
        case "ArrowDown":
          direction = "down";
          break;
        case "q":
        case "ArrowLeft":
          direction = "left";
          break;
        case "d":
        case "ArrowRight":
          direction = "right";
          break;
      }
      return direction;
    }
  }

  setPosition(event, world) {
    const key = this.getKey(event);
    let [x, y, z] = this.positions;
    let position = { x, y, z };
    const nextItems = {
      xplus: world.content.find((tile) => tile.x === x + 1 && tile.y === z),
      xminus: world.content.find((tile) => tile.x === x - 1 && tile.y === z),
      zplus: world.content.find((tile) => tile.x === x && tile.y === z + 1),
      zminus: world.content.find((tile) => tile.x === x && tile.y === z - 1)
    };

    if (key) {
      switch (key) {
        case "up":
          this.validKeys.includes(nextItems.zplus.value)
            ? (position.z += 1)
            : position.z;
          break;
        case "down":
          this.validKeys.includes(nextItems.zminus.value)
            ? (position.z -= 1)
            : position.z;
          break;
        case "left":
          this.validKeys.includes(nextItems.xplus.value)
            ? (position.x += 1)
            : position.x;
          break;
        case "right":
          this.validKeys.includes(nextItems.xminus.value)
            ? (position.x -= 1)
            : position.x;
      }
    }

    this.positions = [position.x, position.y, position.z];
  }

  resetControls() {
    return (this.toggles = this.defaultKeys);
  }
}
