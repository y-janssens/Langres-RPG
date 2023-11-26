import React, { useCallback, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Modal } from '..';
import JSONInput from 'react-json-editor-ajrm';
import locale from 'react-json-editor-ajrm/locale/en';
import css from './editor.module.css';

export const Editor = ({ open, form, setForm, onClose }) => {
    const { t } = useTranslation();
    const [jsonMap, setJsonMap] = useState({ ...form.selectedMap });
    const [initialMap] = useState({ ...form.selectedMap });

    const handleSave = useCallback(() => {
        let map = { ...form.selectedMap };
        map.content = jsonMap;
        setForm('selectedMap', map);
        onClose();
    }, [form, jsonMap, onClose]);

    if (!open) {
        return null;
    }

    return (
        <Modal title={t('builder.modals.editor.title')} subtitle="test" onSave={handleSave} onClose={onClose} onReset={() => setJsonMap(initialMap)}>
            <div className={css['builder-json-editor']}>
                <JSONInput width="100%" locale={locale} placeholder={jsonMap.content} onChange={(value) => setJsonMap(value.jsObject)} />
            </div>
        </Modal>
    );
};
