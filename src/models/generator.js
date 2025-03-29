import { Fetcher } from '.';

export default class GeneratorOptions extends Fetcher {
    constructor(options = {}) {
        super();
        for (const [key, value] of Object.entries(options)) {
            this[key] = this.resolveOptions(value);
        }
    }

    resolveOptions(datas) {
        return datas.map((it, index) => ({ label: it, key: index }));
    }

    get defaultOptions() {
        return {
            options: {
                type: this.types[0]?.label,
                action: this.actions[0]?.label,
                post_action: this.post_actions[0]?.label,
                amount: this.default_sizes[1].label
            }
        };
    }

    get values() {
        return {
            types: 'type',
            actions: 'action',
            post_actions: 'post_action',
            default_sizes: 'amount'
        };
    }

    static command() {
        return 'load_generator_options';
    }

    static fromApi(id, data) {
        return new this(data);
    }
}
