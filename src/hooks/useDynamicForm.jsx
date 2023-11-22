import { useCallback, useState } from 'react';

export const useDynamicForm = (initialForm = {}) => {
    const [form, setForm] = useState(initialForm);
    const [initialValues] = useState(() => Object.freeze(initialForm));

    const setKey = useCallback(
        (name, value) => {
            setForm((form) => {
                if (!(name in form || name === '')) {
                    throw new Error(`Cannot assign not existing key, a default value must be set in initial datas`);
                }

                let newForm = { ...form };
                if (name instanceof Object) {
                    newForm = { ...newForm, ...name };
                } else {
                    newForm[name] = value;
                }

                return newForm;
            });
        },
        [form]
    );

    const setObject = useCallback(
        (obj = {}, merge = false) => {
            setForm((form) => {
                if (!obj || !Object.keys(obj).length) {
                    throw new Error(`Cannot assign empty values`);
                }
                let newForm = merge ? { ...form, ...obj } : obj;
                return newForm;
            });
        },
        [form]
    );

    const resetForm = useCallback(() => {
        setObject(initialValues);
    }, [initialValues]);

    return [form, setKey, setObject, resetForm];
};
