import { useCallback, useState } from 'react';

export const useDynamicForm = (initialForm = {}) => {
    const [form, setForm] = useState(initialForm);
    const [initialValues] = useState(() => Object.freeze(initialForm));

    const setKey = useCallback((name, value) => {
        setForm((form) => {
            const nextValue = typeof value === 'function' ? value(form[name], form) : value;
            validity(name, nextValue);

            let newForm = { ...form };

            if (name instanceof Object) {
                newForm = { ...newForm, ...name };
            } else {
                newForm[name] = nextValue;
            }

            return newForm;
        });
    }, []);

    const setObject = useCallback((obj = {}, merge = false) => {
        setForm((form) => {
            const nextObject = typeof obj === 'function' ? obj(form) : obj;
            validity(nextObject, merge);

            let newForm = merge ? { ...form, ...nextObject } : nextObject;
            return newForm;
        });
    }, []);

    const validity = useCallback((...args) => {
        if (!args || !args.length) {
            throw new Error(`Cannot assign empty values`);
        }

        if (args.some((arg) => arg instanceof Object && !Object.keys(arg).length && !Array.isArray(arg))) {
            throw new Error(`Cannot assign empty objects`);
        }
        return;
    }, []);

    const resetForm = useCallback(() => {
        setObject(initialValues);
    }, [initialValues]);

    return [form, setKey, setObject, resetForm];
};
