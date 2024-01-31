import React, { useCallback } from 'react';
import { useDynamicForm, useTranslation } from '../../hooks';
import Modal from '../ui/Modal';
import css from './menu.module.css';
import { VolumeBar } from '../ui/Gauge';
import Icon from '../ui/Icon';

export default function Settings({ state, onClose = () => {}, context }) {
    const { t } = useTranslation();
    const { languages, language, sound, volume, music } = context.applicationData;

    const [settings, setSettings] = useDynamicForm({
        language,
        sound,
        volume,
        music
    });

    const handleSave = useCallback(() => {
        const appDatas = context.applicationData;
        appDatas.update(settings);
        onClose();
    }, [settings, context, onClose]);

    if (state !== 'settings') {
        return null;
    }
    return (
        <Modal height="500px" name={t('actions.save')} onClick={handleSave}>
            <div className={css['settings-block']}>
                {!context.gameId && (
                    <SettingsItem name={t('menu.settings.language')}>
                        <select className={css['settings-ln-selector']} value={settings.language} onChange={({ target: { value } }) => setSettings('language', value)}>
                            {languages.map((ln, index) => {
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
                    <Icon name={settings.sound ? 'volume' : 'mute'} color="white" onClick={() => setSettings('sound', !settings.sound)} size="large" />
                </SettingsItem>
                <SettingsItem name={t('menu.settings.volume')}>
                    <VolumeBar disabled={!settings.sound} stat={settings.volume} />
                </SettingsItem>
                <SettingsItem name={t('menu.settings.music')}>
                    <VolumeBar disabled={!settings.sound} stat={settings.music} />
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
