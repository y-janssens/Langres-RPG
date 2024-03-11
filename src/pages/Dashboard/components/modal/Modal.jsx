import React, { useCallback, useState, useMemo } from 'react';
import { useCommand, useDynamicForm, useTranslation } from '../../../../hooks';
import useDashboardContext from '../../../../hooks/useDashboardContext';

import { displayValue } from '../../../../components/utils';

import { Input, Textarea, Toggle } from 'react-daisyui';
import { ModalBody } from './ModalBody';

import css from './modal.module.css';

export const Modal = ({ current }) => {
    const { t } = useTranslation();
    const [context, setContext] = useDashboardContext();
    const [instance, setInstance] = useState(null);

    const [form, setForm] = useDynamicForm();

    const [, , syncInstance] = useCommand({
        func: new context.instance().new_command,
        onSuccess: (response) => {
            setInstance(new context.instance(response));
            setForm(new context.instance(response).instance);
        }
    });

    const handleSave = useCallback(() => {
        new context.instance(form).save({ override: true }).then(() => {
            setContext({ instance: null });
            syncInstance();
        });
    }, [form, syncInstance]);

    return (
        <ModalBody title={t(`dashboard.modal.${current.name}-title`)} onClose={() => setContext({ instance: null })} onReset={() => syncInstance()} onSave={handleSave}>
            <div className={css['dashboard-modal-form-block']}>
                {instance &&
                    Object.entries(form)
                        .filter((f) => !['id', 'created', 'modified'].includes(f[0]))
                        .map((field, index) => {
                            return <InstanceItem key={index} current={current} field={field[0]} value={field[1]} onChange={setForm} />;
                        })}
            </div>
        </ModalBody>
    );
};

const InstanceItem = ({ current, field, value, onChange }) => {
    return (
        <div className={css['dashboard-modal-form-item']}>
            <span className={css['dashboard-modal-form-item-label']}>{field}</span>
            <InstanceComponent value={value} field={field} fields={current.fields} onChange={onChange} />
        </div>
    );
};

const InstanceComponent = ({ fields, field, value, onChange }) => {
    const currentField = useMemo(() => fields.find((f) => f.name === field), [fields, field]).field;

    switch (true) {
        case currentField === 'character_field':
        case currentField === 'date_field':
        case currentField === 'dict_field':
            return <Input dataTheme="dark" color="emerald" value={displayValue(value)} placeholder={field} onChange={({ target: { value } }) => onChange(field, value)} />;
        case currentField === 'text_field':
            return (
                <Textarea
                    className={css['dashboard-modal-form-item-text-area']}
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
