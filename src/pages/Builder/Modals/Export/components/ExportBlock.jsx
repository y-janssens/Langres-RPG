import { memo, useCallback, useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';

import { EXPORT_TYPES } from '../../../../../hooks/ExportFormatter';

import { Button } from 'react-daisyui';
import { Toggle, ButtonLabel } from '../../../components';

import css from '../export.module.css';

export const ExportBlock = ({ label, text, formKey, form, setForm, children }) => {
    const [toggle, setToggle] = useState(true);

    const handleClick = useCallback(
        (key) => {
            const value = form[formKey] === key ? null : key;
            setForm(formKey, value);
        },
        [form, formKey]
    );

    return (
        <div className={css['export-block']}>
            <Button dataTheme="business" size="sm" color="primary" animation={false} fullWidth onClick={() => setToggle((prev) => !prev)}>
                {label}
            </Button>
            {toggle && (
                <>
                    <p>{text}</p>
                    {children}
                    <div className={css['export-block-cta']}>
                        {EXPORT_TYPES.map(({ value }, i) => (
                            <ButtonLabel
                                key={i}
                                dataTheme="dark"
                                size="xs"
                                variant={form[formKey] !== value ? 'outline' : null}
                                color={form[formKey] === value ? 'success' : 'neutral'}
                                onClick={() => handleClick(value)}
                                label={value}
                            />
                        ))}
                    </div>
                </>
            )}
        </div>
    );
};

export const ExportSubBlock = ({ label, children }) => {
    const [toggle, setToggle] = useState(true);

    return (
        <div className={css['export-sub-block']}>
            <Button dataTheme="business" size="xs" color="secondary" animation={false} fullWidth onClick={() => setToggle((prev) => !prev)}>
                <span>{label}</span>
            </Button>
            {toggle && children}
        </div>
    );
};

export const SelectToggle = memo(({ items, lookup, form, setForm }) => {
    const { t } = useTranslation();
    const allSelected = useMemo(() => items.every((it) => form[lookup].includes(it)), [form[lookup], items]);

    const handleSelectAll = useCallback(() => {
        if (!allSelected) {
            return setForm(lookup, Array.from(new Set([...form[lookup], ...items])));
        }
        return setForm(
            lookup,
            form[lookup].filter((mp) => !items.includes(mp))
        );
    }, [allSelected, form[lookup], items]);

    if (items.length <= 1) return null;

    return (
        <div className={css['export-select-toggle']}>
            <Toggle title={t('common.actions.select_all')} active={allSelected} onChange={handleSelectAll} />
        </div>
    );
});
