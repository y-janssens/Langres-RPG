export default class Environment {
    constructor({ date, daytime, weather, season, danger, locale, wind_force }) {
        this.date = this.parseDate(date, locale);
        this.daytime = daytime;
        this.season = season;
        this.weather = weather;
        this.danger = danger;
        this.windForce = wind_force;
    }

    parseDate(str, locale) {
        const parts = str.split('/');
        const date = new Date(parts[2], parts[1] - 1, parts[0]);

        return new Intl.DateTimeFormat(locale, {
            day: 'numeric',
            month: 'long',
            year: 'numeric'
        }).format(date);
    }
}
