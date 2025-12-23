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

export const parseCoordinates = (position, y = 0, list = false) => {
    let pos = position;

    if (isArray(position)) {
        pos = { x: position[0], y: position[position.length - 1] };
    }

    const x = -pos.x / 1.5;
    const z = pos.y === 0 ? -pos.y : -pos.y * (Math.sqrt(3) / 1.5);

    if (!list) {
        return { x, z };
    }

    return [x, y, z];
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

export const resolveOptions = (options, name = null, id = null) => {
    const _name = name || 'name';
    const _id = id || 'id';

    if (!options || !options.length) {
        return [];
    }
    if (!Array.isArray(options)) {
        options = [options];
    }
    return options.map((it, index) => {
        if (isObject(it)) {
            return { key: index, text: it[_name], value: it[_id] };
        }
        return { key: index, text: it, value: it };
    });
};

export const listSelection = (source, value) => {
    if (!source.includes(value)) {
        return [...source, value];
    }

    return source.filter((it) => it !== value);
};

export const uniqueSelection = (source, value) => {
    let selection = new Set(source);
    if (!Array.isArray(value)) {
        value = [value];
    }
    value.forEach((v) => {
        if (!selection.has(v)) {
            selection.add(v);
        } else {
            selection.delete(v);
        }
    });
    return Array.from(new Set(selection));
};

export const uniqueList = (...args) => Array.from(new Set(Object.values(args).flatMap((it) => it)));

export const executionTime = (fn, ...args) => {
    const start = performance.now();
    const result = fn(...args);
    const end = performance.now();
    const time = ((end - start) / 1000).toFixed(5);
    return { result, time };
};

export const flatten = (args) => {
    return Object.values(args);
};

export const capitalizeFirstLetter = (string) => {
    if (!string || string.length === 0) {
        return '';
    }

    return `${string.charAt(0).toUpperCase()}${string.slice(1).toLowerCase()}`;
};
