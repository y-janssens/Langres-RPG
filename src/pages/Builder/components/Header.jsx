import { useCallback, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { invoke } from '@tauri-apps/api/core';

import { Navbar, Divider, Button } from 'react-daisyui';

import { ButtonLabel, ButtonIcon, ButtonToggle, MultiSelect, Toggle, MultiButton } from '.';
import { Icon } from '../../../components';
import Zoom from './Zoom';

import css from '../builder.module.css';

export const Header = ({ datas, form, setForm, setObject, reset, sync, history, index, forward, backward, clear }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();

    const handleSave = useCallback(() => {
        invoke('save_storyline', { story: datas }).then(() => {
            sync();
            clear();
        });
    }, [sync, clear, datas]);

    const computeMapDirections = useCallback(async () => {
        let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.content.maps.findIndex((mp) => mp.id === form.selectedMap.id);

        await invoke('compute_map_directions', { map: form.selectedMap }).then((result) => {
            act.content.maps[mapIndex] = result;
            setObject({ ...form, selectedMap: result, selectedTiles: [] });
        });
    }, [form]);

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

    const handleCheck = useCallback(
        (value, checked) => {
            const values = ['showIcons', 'showValues', 'showDirections'].filter((v) => v !== value);
            // Complicated switch, but can easily evolve later if needed
            const toggles = values.reduce((a, v) => ({ ...a, [v]: !checked }), {});
            setObject({ ...form, [value]: checked, ...toggles });
        },
        [form]
    );

    const disabled = useMemo(() => {
        return !form.selectedMap;
    }, [form]);

    const selectLabel = useMemo(() => {
        if (disabled) {
            return t('builder.selector.map');
        }
        return `${form.selectedAct.name} - ${form.selectedMap.name}`;
    }, [form, disabled]);

    return (
        <div className={css['builder-navbar-container']}>
            <Navbar dataTheme="dark">
                <div className={css['builder-navbar-top']}>
                    <div className={css['builder-navbar-left']}>
                        <ButtonLabel color="primary" label={t('builder.manager')} onClick={() => setForm('modal', { type: 'manager', open: true, value: null })} />
                        <ButtonLabel color="primary" label={t('builder.collections')} onClick={() => setForm('modal', { type: 'collections', open: true, value: null })} />
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
                                <MultiButton label={t('builder.toggles.display')} name="displayOptions" open={form.displayOptions} setOpen={setForm}>
                                    <Toggles form={form} handleCheck={handleCheck} disabled={disabled} />
                                </MultiButton>
                            </div>
                        </div>
                        <Zoom form={form} setObject={setObject} disabled={!form.flatDisplay || !form.selectedMap} />
                    </div>

                    <div className={css['builder-navbar-cta']}>
                        <Divider className={css['builder-navbar-divider']} horizontal />
                        <MultiButton icon="actions" name="displayActions" open={form.displayActions} setOpen={setForm}>
                            <Actions form={form} setForm={setForm} handleExport={handleExport} computeMapDirections={computeMapDirections} />
                        </MultiButton>
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

const Toggles = ({ form, disabled, handleCheck }) => {
    const { t } = useTranslation();

    const toggles = useMemo(
        () => [
            { key: 'ids', value: 'showIds', disabled: disabled },
            { key: 'values', value: 'showValues', disabled: disabled },
            { key: 'icons', value: 'showIcons', disabled: disabled || !form.flatDisplay },
            { key: 'constraints', value: 'showConstraints', disabled: disabled },
            { key: 'meshes', value: 'showObjects', disabled: disabled || form.flatDisplay },
            { key: 'directions', value: 'showDirections', disabled: disabled || !form.flatDisplay }
        ],
        [form, disabled]
    );

    return toggles.map((it, index) => (
        <Toggle key={index} title={t(`builder.toggles.${it.key}`)} active={form[it.value]} onChange={() => handleCheck(it.value, !form[it.value])} disabled={it.disabled} />
    ));
};

const Actions = ({ form, setForm, computeMapDirections, handleExport }) => {
    const { t } = useTranslation();

    const handleAction = useCallback(
        (action) => {
            const actions = {
                handleExport: () => handleExport(),
                computeMapDirections: () => computeMapDirections(),
                previewMap: () => setForm('modal', { type: 'preview', open: true, value: form.selectedMap })
            };

            try {
                actions[action]();
                setForm('displayActions', false);
            } catch (error) {
                console.error(error);
            }
        },
        [handleExport, form.selectedMap, computeMapDirections]
    );

    return (
        <>
            <ButtonLabel fullWidth color="primary" label={t('common.actions.export')} onClick={() => handleAction('handleExport')} />
            <ButtonLabel fullWidth color="primary" label={t('common.actions.preview')} onClick={() => handleAction('previewMap')} />
            <ButtonLabel fullWidth color="primary" label={t('common.actions.compute')} onClick={() => handleAction('computeMapDirections')} />
        </>
    );
};

const HistoryIcons = ({ index, history, onChange, disabled }) => {
    return (
        <>
            <ButtonIcon icon={<Icon name="undo" />} disabled={disabled || index === 0} onClick={() => onChange('undo')} />
            <ButtonIcon icon={<Icon name="redo" />} disabled={disabled || index === history.length - 1} onClick={() => onChange('redo')} />
        </>
    );
};
