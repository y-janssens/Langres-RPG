import React, { useMemo } from 'react';
import { useTranslation } from 'react-i18next';

import { displayValue } from '../../../../components/utils';
import { Input, Textarea, Toggle } from 'react-daisyui';
import { Select } from '../../../../components/ui/Select';

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
            <InstanceComponent value={value} field={field} options={current.options} currentField={currentField} onChange={onChange} />
        </div>
    );
};

const InstanceComponent = ({ currentField, options, field, value, onChange }) => {
    const { t } = useTranslation();
    switch (true) {
        case currentField === 'choice_field':
            return <Select options={options} value={value} onChange={(value) => onChange(field, value)} />;
        case currentField === 'character_field':
        case currentField === 'number_field':
        case currentField === 'dict_field':
            return (
                <Input
                    dataTheme="dark"
                    color="emerald"
                    value={displayValue(value)}
                    placeholder={t(`dashboard.form.fields.${field}`)}
                    onChange={({ target: { value } }) => onChange(field, currentField === 'number_field' ? Number(value) : value)}
                />
            );
        case currentField === 'translatable_field':
            return Object.entries(value)
                .map((entry) => ({ key: entry[0], value: entry[1] }))
                .map((it, index) => (
                    <div className={css['dashboard-form-item-translate-input']} key={index}>
                        <Input
                            dataTheme="dark"
                            color="emerald"
                            value={displayValue(it.value)}
                            placeholder={`${t(`dashboard.form.fields.${field}`)}: ${it.key}`}
                            onChange={({ target }) => {
                                const _field = { ...value, [it.key]: target.value };
                                onChange(field, _field);
                            }}
                        />
                    </div>
                ));
        case currentField === 'text_field':
            return (
                <Textarea
                    className={css['dashboard-form-item-text-area']}
                    dataTheme="dark"
                    color="emerald"
                    value={JSON.stringify(value, null, 2)}
                    placeholder={t(`dashboard.form.fields.${field}`)}
                    onChange={({ target: { value } }) => onChange(field, value)}
                />
            );
        case currentField === 'boolean_field':
            return <Toggle color="success" checked={!!displayValue(value)} size="xs" onChange={({ target: { checked } }) => onChange(field, checked)} height="250px" />;
    }
};
