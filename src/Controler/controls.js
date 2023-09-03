export default class KeyControls {
  constructor() {
    this.allowedKeys = [
      { name: "menu", key: "Escape", value: false },
      { name: "character", key: "c", value: false },
      { name: "interface", key: "h", value: true },
      { name: "map", key: "m", value: false },
      { name: "inventory", key: "i", value: false }
    ];
    this.toggles = {};
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
}
