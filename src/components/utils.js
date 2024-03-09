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
