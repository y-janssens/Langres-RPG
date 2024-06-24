import i18next from 'i18next';
import Fetcher from './fetcher';

export default class Environment extends Fetcher {
    constructor({ date, daytime, weather, season, danger, wind_force }) {
        super();
        this.date = this.parseDate(date);
        this.daytime = daytime;
        this.season = season;
        this.weather = weather;
        this.danger = danger;
        this.windForce = wind_force;
        this.time = new Time();
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

export class Time {
    constructor() {
        this.time = new Date();
        this.speed = 1;
        this.start();
    }

    start() {
        this.interval = setInterval(() => {
            this.updateTime();
        }, 1000);
    }

    updateTime() {
        this.time.setMinutes(this.time.getMinutes() + this.speed);
    }

    getLuminosity() {
        let luminosity = 12;
        const sunrise = 6 * 60;
        const sunset = 18 * 60;
        const currentTime = this.time.getHours() * 60 + this.time.getMinutes();

        const dayLight = Math.min(((currentTime - sunrise) / 360) * 100, 100);
        const nightLight = Math.max(100 - ((currentTime - sunset) / 360) * 100, 0);

        if (currentTime >= sunrise && currentTime < sunrise + 360) {
            luminosity = dayLight;
        } else if (currentTime >= sunrise + 360 && currentTime < sunset) {
            luminosity = 100;
        } else if (currentTime >= sunset && currentTime < sunset + 360) {
            luminosity = nightLight;
        }

        return Math.min(Math.max(parseInt(luminosity), 0), 100);
    }

    get output() {
        return {
            time: new Intl.DateTimeFormat(i18next.language, {
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            }).format(this.time),
            progression: this.getLuminosity()
        };
    }
}
