export default class BaseEngine {
    set(key, data) {
        // if (!Object.prototype.hasOwnProperty.call(this, key)) {
        //     throw new Error(`Property does not exist: ${key}`);
        // }
        this[key] = data;
    }

    accessor(key, fn, ...args) {
        if (!Object.prototype.hasOwnProperty.call(this, key)) {
            throw new Error(`Property does not exist: ${key}`);
        }
        return this[key][fn](...args);
    }

    instantiate(instance) {
        if (!instance.instance) {
            instance.instance = this;
        }
        return instance.instance;
    }
}
