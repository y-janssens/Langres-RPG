import React, { useCallback, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Button } from 'react-daisyui';
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
        <div className={css['editor-container']}>
            <div className={css['editor-body']}>
                <div className={css['editor-body-header']}>
                    {t('builder.editor.title')}
                    <Button dataTheme="business" className={css['editor-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                        x
                    </Button>
                </div>
                <div className={css['editor-card-block']}>
                    <div className={css['editor-card-body']}>
                        <div className={css['editor-card-header']}>
                            <div>{`${form.selectedAct.name} - ${form.selectedAct.title}: ${form.selectedMap.name}`}</div>
                        </div>

                        <div className={css['editor-card-content']}>
                            <div className={css['builder-json-editor']}>
                                <JSONInput width="100%" locale={locale} placeholder={jsonMap.content} onChange={(value) => setJsonMap(value.jsObject)} />
                            </div>
                        </div>
                        <div className={css['editor-footer']}>
                            <Button className={css['editor-btns']} dataTheme="dark" size="sm" color="default" variant="outline" onClick={() => setJsonMap(initialMap)}>
                                {t('actions.reset')}
                            </Button>
                            <Button className={css['editor-btns']} dataTheme="business" size="sm" color="primary" disabled={false} onClick={handleSave}>
                                {t('actions.save')}
                            </Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};
