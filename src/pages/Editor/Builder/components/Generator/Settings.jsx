import React, { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';

import { SelectButton } from '../selector/Selector';

import css from './generator.module.css';

export const GeneratorSettings = ({ display, settings, options, handleSelect = () => {} }) => {
    const [open, setOpen] = useState({ type: false, action: false, post_action: false, amount: false });

    if (!display || !options) {
        return null;
    }

    return (
        <div className={css['map-preview-settings']}>
            {Object.entries(options)?.map(([key, value], index) => (
                <OptionSelector
                    key={index}
                    type={options.values[key]}
                    open={open[options.values[key]]}
                    settings={settings}
                    options={value}
                    setOpen={setOpen}
                    handleSelect={handleSelect}
                />
            ))}
        </div>
    );
};

const OptionSelector = ({ type, open, settings, options, setOpen, handleSelect }) => {
    const { t } = useTranslation();

    const label = useMemo(() => {
        if (!settings.options[type]) {
            return t(`builder.modals.generator.${type}`);
        }

        if (type === 'amount') {
            return settings.options[type];
        }

        return t(`builder.modals.generator.types.${settings.options[type]}`);
    }, [settings, options, type]);

    return (
        <div className={css['map-preview-settings-block']}>
            <span>{t(`builder.modals.generator.${type}`)}</span>
            <SelectButton open={open} label={label} onClick={() => setOpen({ ...open, [type]: !open })} />
            {open && (
                <div className={css['map-preview-cta-content']}>
                    {options.map((el) => {
                        return (
                            <span
                                key={el.key}
                                className={css['map-preview-cta-content-item']}
                                onClick={() => {
                                    handleSelect(type, el.label);
                                    setOpen(false);
                                }}
                            >
                                {`- ${type === 'amount' ? el.label : t(`builder.modals.generator.types.${el.label}`)}`}
                            </span>
                        );
                    })}
                </div>
            )}
        </div>
    );
};
