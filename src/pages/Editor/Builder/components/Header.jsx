import { useCallback, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { invoke } from '@tauri-apps/api';
import { Navbar, Divider, Button } from 'react-daisyui';
import { useTranslation } from 'react-i18next';
import { ButtonLabel, ButtonIcon, ButtonToggle, MultiSelect, Toggle } from '.';
import Icon from '../../../../components/ui/Icon';
import css from '../builder.module.css';
import Zoom from './Zoom';

export const Header = ({ datas, form, setForm, setObject, reset, sync, history, index, forward, backward, clear }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();

    const handleSave = useCallback(() => {
        invoke('save_storyline', { data: datas, id: datas.id }).then(() => {
            sync();
            clear();
        });
    }, [sync, clear, datas]);

    const handleExport = useCallback(async () => {
        let _datas = { ...datas }.story.acts;
        _datas.map((act) => {
            return act.content.maps.map((mp) => {
                mp.npcs = [];
                return mp;
            });
        });
        await navigator.clipboard.writeText(JSON.stringify(_datas, null, 2)).then(() => {
            sync();
        });
    }, [datas, sync]);

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
        [form, backward, forward]
    );

    const disabled = useMemo(() => {
        return !form.selectedMap;
    }, [form]);

    const selectLabel = useMemo(() => {
        if (disabled) {
            return t('builder.selector.map');
        }
        return `${form.selectedAct.name} - ${form.selectedMap.name}`;
    }, [form]);

    return (
        <div className={css['builder-navbar-container']}>
            <Navbar dataTheme="dark">
                <div className={css['builder-navbar-top']}>
                    <div className={css['builder-navbar-left']}>
                        <ButtonLabel
                            color="primary"
                            label={t('builder.manager')}
                            onClick={() => setObject({ ...form, modalManager: !form.modalManager, modalSelect: false, modalEditor: false })}
                        />
                        <MultiSelect label={selectLabel} datas={datas} setForm={setForm} form={form} />
                    </div>

                    <div className={css['builder-navbar-toggles']}>
                        <ButtonToggle label={t('builder.toggles.viewport')} active={!form.flatDisplay} onClick={() => setForm('flatDisplay', !form.flatDisplay)} />
                        <Button dataTheme="business" className={css['builder-navbar-exit']} size="xs" color="accent" shape="square" onClick={() => navigate('/')}>
                            x
                        </Button>
                    </div>
                </div>
            </Navbar>

            <Navbar className={css['builder-navbar-secondary']} dataTheme="dracula">
                <div className={css['builder-navbar']}>
                    <div className={css['builder-navbar-actions-block']}>
                        <div className={css['builder-navbar-actions']}>
                            <HistoryIcons index={index} history={history} onChange={handleHistory} disabled={disabled} />

                            <div className={css['builder-navbar-flatDisplay-toggles']}>
                                <Toggle title={t('builder.toggles.ids')} active={form.showIds} onChange={(event) => setForm('showIds', event.target.checked)} disabled={disabled} />
                                <Toggle
                                    title={t('builder.toggles.values')}
                                    active={form.showValues}
                                    onChange={({ target: { checked } }) => {
                                        setForm('showValues', checked);
                                        setForm('showIcons', !checked);
                                    }}
                                    disabled={disabled}
                                />
                                <Toggle
                                    title={t('builder.toggles.icons')}
                                    active={form.showIcons}
                                    onChange={({ target: { checked } }) => {
                                        setForm('showIcons', checked);
                                        setForm('showValues', !checked);
                                    }}
                                    disabled={disabled || !form.flatDisplay}
                                />
                                <Toggle
                                    title={t('builder.toggles.meshes')}
                                    active={form.showObjects}
                                    onChange={({ target: { checked } }) => setForm('showObjects', checked)}
                                    disabled={disabled || form.flatDisplay}
                                />
                            </div>
                        </div>
                        <Zoom form={form} setValues={setObject} disabled={!form.flatDisplay || !form.selectedMap} />
                    </div>

                    <div className={css['builder-navbar-cta']}>
                        <Divider className={css['builder-navbar-divider']} horizontal />
                        <ButtonLabel variant="outline" label={t('common.actions.export')} onClick={handleExport} />
                        <ButtonLabel
                            variant="outline"
                            label={t('common.actions.reset')}
                            disabled={disabled}
                            onClick={() => {
                                reset();
                                sync();
                            }}
                        />
                        <ButtonLabel color="primary" label={t('common.actions.save')} disabled={disabled} onClick={handleSave} />
                    </div>
                </div>
            </Navbar>
        </div>
    );
};

const HistoryIcons = ({ index, history, onChange, disabled }) => {
    return (
        <>
            <ButtonIcon icon={<Icon name="undo" />} size="sm" disabled={disabled || index === 0} onClick={() => onChange('undo')} />
            <ButtonIcon icon={<Icon name="redo" />} size="sm" disabled={disabled || index === history.length - 1} onClick={() => onChange('redo')} />
        </>
    );
};
