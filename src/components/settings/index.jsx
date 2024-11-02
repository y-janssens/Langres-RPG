import React, { useCallback, useState } from 'react';
import { useGameContext, useTranslation } from '../../hooks';

import SettingComponent from './SettingComponent';
import { Button, Form } from 'react-daisyui';
import Icon from '../ui/Icon';

import css from './dev.module.css';

export const QuickSettings = () => {
    const { t } = useTranslation();
    const [engine, setEngine] = useGameContext();
    const [open, setOpen] = useState(false);

    const handleChange = useCallback(
        (label, key, value) => {
            const { settings } = engine;
            settings.toggle(label, key, value);
            setEngine({ ...engine, settings });
        },
        [engine]
    );

    const handleReset = useCallback(() => {
        const { settings } = engine;
        settings.reset();
        setEngine({ ...engine, settings });
    }, [engine]);

    return (
        <div className={css['quicksettings-container']}>
            <div className={css['quicksettings-toggle']}>
                <Icon name="settings" size="medium" color="white" onClick={() => setOpen(!open)} />
            </div>
            {open && (
                <div className={css['quicksettings-body']}>
                    <div className={css['quicksettings-body-header']}>
                        <div>{t('engine.quicksettings.title')}</div>
                        <span>
                            <Icon name="reset" size="medium" color="white" onClick={handleReset} />
                            <Icon name="settings" size="medium" color="white" onClick={() => setOpen(!open)} />
                        </span>
                    </div>
                    <div className={css['quicksettings-content']}>
                        {Object.entries(engine.settings.settings).map(([label, values]) => (
                            <QuickSettingsBlock key={label} label={label} values={values} handleChange={handleChange} />
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
};

const QuickSettingsBlock = ({ label, values, handleChange }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(true);

    return (
        <div className={css['quicksettings-block']}>
            <Button dataTheme="light" size="xs" color="neutral" fullWidth onClick={() => setOpen(!open)}>
                {label}
            </Button>
            {open &&
                Object.entries(values)
                    .sort(([, a], [, b]) => a.order - b.order)
                    .map(([key, item]) => (
                        <Form.Label key={key} className={css['quicksettings-toggles']} title={t(`engine.quicksettings.values.${key}`)}>
                            <SettingComponent item={item} group={label} label={key} handleChange={handleChange} />
                        </Form.Label>
                    ))}
        </div>
    );
};
