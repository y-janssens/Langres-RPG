import i18next from 'i18next';
import Fetcher from './fetcher';

export default class Environment extends Fetcher {
    constructor({ date, daytime, weather, season, danger, wind_force }) {
        super('env');
        this.date = this.parseDate(date);
        this.daytime = daytime;
        this.season = season;
        this.weather = weather;
        this.danger = danger;
        this.windForce = wind_force;
    }

    parseDate(str) {
        const parts = str.split('/');
        const date = new Date(parts[2], parts[1] - 1, parts[0]);

        return new Intl.DateTimeFormat(i18next.language, {
            day: 'numeric',
            month: 'long',
            year: 'numeric'
        }).format(date);
    }

    static command() {
        return 'load_env';
    }

    static fromApi(id, data) {
        return new this(data);
    }
}
