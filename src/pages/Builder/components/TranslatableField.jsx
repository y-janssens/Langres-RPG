import React, { useState } from 'react';
import i18next from 'i18next';

import { useGameContext } from '../../../hooks';

import { Input } from 'react-daisyui';
import { Select } from './selector/Selector';

import css from '../builder.module.css';

const TranslatableField = ({ form, setForm, label, entry }) => {
    const [{ applicationData: settings }] = useGameContext();
    const { languagesOptions } = settings;

    const [selectedLanguage, setSelectedLanguage] = useState(i18next.language);

    return (
        <>
            <p>{label}</p>
            <div className={css['translatable-fields']}>
                <div className={css['translatable-field']}>
                    <Input
                        size="sm"
                        color="neutral"
                        dataTheme="dark"
                        placeholder={`${label} ${selectedLanguage}`}
                        value={form[entry][selectedLanguage] || ''}
                        onChange={({ target: { value } }) => setForm(entry, (prev) => ({ ...prev, [selectedLanguage]: value || null }))}
                    />
                    <Select options={languagesOptions} value={selectedLanguage} onSelect={setSelectedLanguage} />
                </div>
            </div>
        </>
    );
};

export default TranslatableField;
