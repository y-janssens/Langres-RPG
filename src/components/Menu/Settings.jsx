import React, { useCallback } from 'react';
import { useDynamicForm, useGameContext, useTranslation } from '../../hooks';

import { Modal, VolumeBar, Icon } from '../ui';

import css from './menu.module.css';

export default function Settings({ onClose = () => {} }) {
    const { t } = useTranslation();
    const [engine] = useGameContext();
    const [settings, setSettings] = useDynamicForm({ ...engine.applicationData });

    const handleSave = useCallback(() => {
        const appDatas = engine.applicationData;
        appDatas.update(settings);
        onClose();
    }, [settings, engine, onClose]);

    return (
        <Modal height="500px" name={t('common.actions.save')} onClick={handleSave}>
            <div className={css['settings-block']}>
                {!engine.gameId && (
                    <SettingsItem name={t('menu.settings.language')}>
                        <select className={css['settings-ln-selector']} value={settings.language} onChange={({ target: { value } }) => setSettings('language', value)}>
                            {settings.languages.map((ln, index) => {
                                return (
                                    <option key={index} value={ln.key}>
                                        {ln.value}
                                    </option>
                                );
                            })}
                        </select>
                    </SettingsItem>
                )}
                <SettingsItem name={t('menu.settings.sound')}>
                    <Icon
                        name={settings.sound && (settings.volume > 0 || settings.music) > 0 ? 'volume' : 'mute'}
                        color="white"
                        onClick={() => setSettings('sound', !settings.sound)}
                        size="large"
                    />
                </SettingsItem>
                <SettingsItem name={t('menu.settings.volume')}>
                    <VolumeBar disabled={!settings.sound} stat={settings.volume} name="volume" onChange={setSettings} />
                </SettingsItem>
                <SettingsItem name={t('menu.settings.music')}>
                    <VolumeBar disabled={!settings.sound} stat={settings.music} name="music" onChange={setSettings} />
                </SettingsItem>
            </div>
        </Modal>
    );
}

function SettingsItem({ name, children, display = true }) {
    if (!display) {
        return null;
    }

    return (
        <div className={css['settings-item']}>
            <span className={css['settings-item-header']}>{name}</span>
            {children}
        </div>
    );
}
