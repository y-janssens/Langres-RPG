import i18next from 'i18next';

export const IsBoolean = (value) => typeof value === 'boolean';
export const isObject = (value) => typeof value === 'object';
export const isArray = (value) => Array.isArray(value);

export const relativeNumber = (value) => {
    if (Array.isArray(value)) {
        return value.map((i) => Math.round(Math.abs(i)));
    }
    return Math.round(Math.abs(value));
};

export const extractCoordinates = (values) => {
    return {
        x: relativeNumber(values[0]) + 2,
        y: relativeNumber(values[2]) - 1,
        z: relativeNumber(values[1])
    };
};

export const matchSearch = (values, search) => {
    if (!Array.isArray(values)) {
        values = [values];
    }
    const reg = new RegExp(search, 'gi');
    return values.some((value) => reg.test(value));
};

const match = (value) => {
    const _fields = ['date', 'modified', 'created'];
    if (typeof value !== 'string') {
        return false;
    }
    const fields = _fields.join('|');
    return new RegExp(fields, 'gi').test(value);
};

export const displayValue = (value) => {
    if (!value) {
        return '';
    }
    if (isObject(value)) {
        return stringify(value);
    }
    if (!match(value)) {
        return value;
    }

    const date = new Date(String(value?.split(' ')[0]));

    return new Intl.DateTimeFormat(i18next.language, {
        day: 'numeric',
        month: 'long',
        year: 'numeric'
    }).format(date);
};

const stringify = (value) => {
    return JSON.stringify(value)
        .replace(/["{}]/g, '')
        .replace(/(:)(\d+)/g, ': $2')
        .replace(/,/g, ', ');
};
