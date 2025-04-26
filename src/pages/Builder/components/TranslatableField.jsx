import React, { useCallback, useMemo } from 'react';

import { Input } from 'react-daisyui';

import css from '../builder.module.css';

const TranslatableField = ({ form, setForm, label, entry }) => {
    const field = useMemo(() => form[entry], [form, entry]);

    const handleChange = useCallback(
        (key, value) => {
            setForm(entry, { ...form[entry], [key]: value || null });
        },
        [form, entry]
    );

    return (
        <>
            <p>{label}</p>
            <div className={css['translatable-fields']}>
                {Object.entries(field).map(([key, val], index) => {
                    return (
                        <div className={css['translatable-field']} key={index}>
                            <Input
                                size="sm"
                                color="neutral"
                                dataTheme="dark"
                                placeholder={`${label} ${key}`}
                                value={val || ''}
                                onChange={({ target: { value } }) => handleChange(key, value)}
                            />
                        </div>
                    );
                })}
            </div>
        </>
    );
};

export default TranslatableField;
