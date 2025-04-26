import i18next from 'i18next';
import { AdminModel, Fetcher } from '.';

export default class Loot extends AdminModel {
    constructor(options = {}) {
        super(options, 'loot');
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
        this.payload = { kind: 'weapon' };
    }

    display(key) {
        if (key === 'name' || key === 'description') {
            return this.stringify(this[key][i18next.language]) || ' ';
        }
        return super.display(key);
    }

    get label() {
        const { language } = i18next;
        return `${this.name[language]} - ${this.description[language]}`;
    }

    get stats() {
        const { t } = i18next;
        return `${t('builder.modals.npc.inventory.armor')}: ${this.armor} - ${t('builder.modals.npc.inventory.damage')}: ${this.damage} - ${t(
            'builder.modals.npc.inventory.price'
        )}: ${this.price} - ${t('builder.modals.npc.inventory.weight')}: ${this.weight}`;
    }

    static command(generate) {
        // eslint-disable-line
        if (!generate) {
            return 'load_loots';
        }
        return 'generate_loot';
    }
}

export class LootTable extends Fetcher {
    constructor(options = {}) {
        super();
        Object.keys(options).forEach((key) => {
            this[key] = options[key];
        });
    }

    // eslint-disable-next-line
    static command(id) {
        return 'generate_loot_table';
    }
}
