import React, { useMemo } from 'react';
import { useTranslation } from 'react-i18next';

import { displayValue } from '../../../../components/utils';
import { Input, Textarea, Toggle } from 'react-daisyui';

import css from './form.module.css';

export const InstanceItem = ({ current, field, value, onChange }) => {
    const { t } = useTranslation();
    const currentField = useMemo(() => current.fields.find((f) => f.name === field), [current, field])?.field;
    const ignoredFields = ['date_field', 'primary_key_field', 'cta_field'];
    if (!currentField || ignoredFields.some((f) => f === currentField)) {
        return null;
    }
    return (
        <div className={css['dashboard-form-item']}>
            <span className={css['dashboard-form-item-label']}>{t(`dashboard.form.fields.${field}`)}</span>
            <InstanceComponent value={value} field={field} currentField={currentField} onChange={onChange} />
        </div>
    );
};

const InstanceComponent = ({ currentField, field, value, onChange }) => {
    switch (true) {
        case currentField === 'character_field':
        case currentField === 'dict_field':
            return <Input dataTheme="dark" color="emerald" value={displayValue(value)} placeholder={field} onChange={({ target: { value } }) => onChange(field, value)} />;
        case currentField === 'text_field':
            return (
                <Textarea
                    className={css['dashboard-form-item-text-area']}
                    dataTheme="dark"
                    color="emerald"
                    value={JSON.stringify(value, null, 2)}
                    placeholder={field}
                    onChange={({ target: { value } }) => onChange(field, value)}
                />
            );
        case currentField === 'boolean_field':
            return <Toggle color="success" checked={!!displayValue(value)} size="xs" onChange={({ target: { checked } }) => onChange(field, checked)} height="250px" />;
    }
};
