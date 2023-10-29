import React, { useCallback, useMemo } from 'react';
import { useForm } from '../../hooks';
import { useTranslation } from 'react-i18next';
import Modal from '../ui/Modal';
import css from './menu.module.css';
import { VolumeBar } from '../ui/Gauge';
import Icon from '../ui/Icon';

export default function Settings({ state, onClose = () => {}, context }) {
    const { t } = useTranslation();
    const { languages, language, sound, volume, music, codes } = context.applicationData;

    const [settings, setSettings] = useForm({
        language,
        sound,
        volume,
        music,
        codes
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
                        <select className={css['settings-ln-selector']} value={settings.language} onChange={(e) => setSettings('language', e.target.value)}>
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
                {context['gameId'] &&
                    settings.codes.map((it) => {
                        return <Code key={it.id} item={it} game={context.game} />;
                    })}
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

function Code({ item, game }) {
    const status = useMemo(() => {
        if (!game.activated.includes(item)) {
            return 'check';
        }
        return 'checked';
    }, [item, game]);

    const handleActivate = useCallback(() => {
        if (!status || status === 'check') {
            return game.activate(item);
        }
        return game.deactivate(item);
    });
    return (
        <SettingsItem name={item.key}>
            <Icon name={status} color="white" onClick={handleActivate} size="large" />
        </SettingsItem>
    );
}
