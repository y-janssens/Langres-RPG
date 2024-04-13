export default class Inventory {
    constructor(options = {}) {
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }
}
