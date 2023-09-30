import React, { useCallback, useEffect, useState } from 'react';
import css from './ui.module.css';

export default function Input({ context }) {
    const [value, setValue] = useState('');

    const handleChange = useCallback(
        (event) => {
            setValue(event.target.value);
        },
        [value]
    );

    const handleSettings = useCallback(() => {
        context.codes.validate(value, context.game);
        let settings = { ...context.applicationData };
        let keys = [...settings.codes, ...context.codes.keys];
        settings.codes = Array.from(new Set(keys.map(JSON.stringify))).map(JSON.parse);
        context.applicationData.setCodes({ ...settings });
    }, [value]);

    useEffect(() => {
        if (!context.controls.toggles.input) {
            setValue('');
        }
        if (value) {
            handleSettings();
        }
    }, [context, handleSettings, value]);

    if (!context.controls.toggles.input) {
        return null;
    }
    return (
        <div className={css['game-input']}>
            <input type="text" value={value} onChange={handleChange} />
        </div>
    );
}
