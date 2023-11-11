import { useCallback, useMemo } from 'react';
import { invoke } from '@tauri-apps/api';
import { Navbar, Divider, Button } from 'react-daisyui';
import { useTranslation } from 'react-i18next';
import Icon from '../../ui/Icon';
import { ButtonLabel, ButtonIcon, ButtonToggle, MultiSelect, Toggle } from '.';
import css from '../builder.module.css';

export const Header = ({ datas, form, setForm, reset, sync, setContext, history, index, forward, backward, clear }) => {
    const { t } = useTranslation();
    const handleSave = useCallback(() => {
        invoke('save_storyline', { data: datas, id: datas.id }).then(() => {
            sync();
            clear();
        });
    }, [sync, clear, datas]);

    const handleHistory = useCallback(
        (direction) => {
            switch (direction) {
                case 'undo':
                    backward();
                    break;
                case 'redo':
                    forward();
                    break;
                default:
                    break;
            }
            let map = { ...form }.selectedMap;
            map.content = history[index];
            setForm('selectedMap', map);
        },
        [backward, forward]
    );

    const selectLabel = useMemo(() => {
        if (form.selectedMap === 'default') {
            return t('builder.selector.label');
        }
        return `${form.selectedAct.name} - ${form.selectedMap.name}`;
    });

    return (
        <>
            <Navbar dataTheme="dark" style={{ minHeight: '2rem' }}>
                <div className={css['builder-navbar-top']}>
                    <div className={css['builder-navbar-left']}>
                        <ButtonLabel color="primary" label={t('builder.manager')} onClick={() => setForm('modalNew', true)} />
                        <MultiSelect label={selectLabel} datas={datas} onSelect={setForm} />
                    </div>
                    <div className={css['builder-navbar-toggles']}>
                        <ButtonToggle label={t('builder.toggles.viewport')} active={!form.mode} onClick={() => setForm('mode', !form.mode)} />
                        <Button dataTheme="business" className={css['builder-navbar-exit']} size="xs" color="accent" shape="square" onClick={() => setContext({ builder: false })}>
                            x
                        </Button>
                    </div>
                </div>
            </Navbar>
            <Navbar className={css['builder-navbar-secondary']} dataTheme="dracula" style={{ minHeight: '3rem' }}>
                <div className={css['builder-navbar']}>
                    <div className={css['builder-navbar-actions']}>
                        <ButtonIcon icon={<Icon name="undo" />} size="sm" disabled={form.selectedMap === 'default' || index === 0} onClick={() => handleHistory('undo')} />
                        <ButtonIcon
                            icon={<Icon name="redo" />}
                            size="sm"
                            disabled={form.selectedMap === 'default' || index === history.length - 1}
                            onClick={() => handleHistory('redo')}
                        />
                        <div className={css['builder-navbar-viewport-toggles']}>
                            <Toggle
                                title={t('builder.toggles.ids')}
                                active={form.showIds}
                                onChange={(event) => setForm('showIds', event.target.checked)}
                                disabled={form.selectedMap === 'default'}
                            />
                            <Toggle
                                title={t('builder.toggles.values')}
                                active={form.showValues}
                                onChange={(event) => {
                                    setForm('showValues', event.target.checked);
                                    setForm('showIcons', !event.target.checked);
                                }}
                                disabled={form.selectedMap === 'default'}
                            />
                            <Toggle
                                title={t('builder.toggles.icons')}
                                active={form.showIcons}
                                onChange={(event) => {
                                    setForm('showIcons', event.target.checked);
                                    setForm('showValues', !event.target.checked);
                                }}
                                disabled={form.selectedMap === 'default' || !form.mode}
                            />
                            <Toggle
                                title={t('builder.toggles.meshes')}
                                active={form.showObjects}
                                onChange={(event) => setForm('showObjects', event.target.checked)}
                                disabled={form.selectedMap === 'default' || form.mode}
                            />
                        </div>
                    </div>
                    <div className={css['builder-navbar-cta']}>
                        <Divider style={{ margin: 0 }} horizontal />
                        <ButtonLabel
                            variant="outline"
                            label={t('actions.reset')}
                            disabled={form.selectedMap === 'default'}
                            onClick={() => {
                                reset();
                                sync();
                            }}
                        />
                        <ButtonLabel color="primary" label={t('actions.save')} disabled={form.selectedMap === 'default'} onClick={handleSave} />
                    </div>
                </div>
            </Navbar>
        </>
    );
};
