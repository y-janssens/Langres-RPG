import { useCallback } from 'react';
import { invoke } from '@tauri-apps/api';
import { Navbar, Divider } from 'react-daisyui';
import Icon from '../../ui/Icon';
import { ButtonLabel, ButtonIcon, ButtonToggle, MultiSelect, Toggle } from '.';
import css from '../builder.module.css';

export const Header = ({ datas, form, setForm, reset, sync }) => {
    const handleSave = useCallback(() => {
        invoke('save_storyline', { data: datas }).then(() => {
            sync();
        });
    }, [sync, datas]);
    return (
        <>
            <Navbar dataTheme="dark" style={{ minHeight: '2rem' }}>
                <div className={css['builder-navbar-top']}>
                    <div className={css['builder-navbar-left']}>
                        <ButtonLabel color="primary" label="New" onClick={() => setForm('modalNew', true)} />
                        <MultiSelect label="Select Map" datas={datas} onSelect={setForm} />
                        <Toggle title="Show Ids" active={form.showIds} onChange={(event) => setForm('showIds', event.target.checked)} disabled={form.selectedMap === 'default'} />
                        <Toggle
                            title="Show Values"
                            active={form.showValues}
                            onChange={(event) => {
                                setForm('showValues', event.target.checked);
                                setForm('showIcons', !event.target.checked);
                            }}
                            disabled={form.selectedMap === 'default'}
                        />
                        <Toggle
                            title="Show Icons"
                            active={form.showIcons}
                            onChange={(event) => {
                                setForm('showIcons', event.target.checked);
                                setForm('showValues', !event.target.checked);
                            }}
                            disabled={form.selectedMap === 'default'}
                        />
                        <Toggle
                            title="Show Meshes"
                            active={form.showObjects}
                            onChange={(event) => setForm('showObjects', event.target.checked)}
                            disabled={form.selectedMap === 'default' || form.mode}
                        />
                    </div>
                    <div className={css['builder-navbar-toggles']}>
                        <ButtonToggle icon="2D" active={!form.mode} onClick={() => setForm('mode', !form.mode)} />
                    </div>
                </div>
            </Navbar>
            <Navbar className={css['builder-navbar-secondary']} dataTheme="dracula" style={{ minHeight: '3rem' }}>
                <div className={css['builder-navbar']}>
                    <div className={css['builder-navbar-actions']}>
                        <ButtonIcon icon={<Icon name="undo" />} size="sm" disabled />
                        <ButtonIcon icon={<Icon name="redo" />} size="sm" disabled />
                    </div>
                    <div className={css['builder-navbar-cta']}>
                        <Divider style={{ margin: 0 }} horizontal />
                        <ButtonLabel
                            variant="outline"
                            label="Reset"
                            disabled={form.selectedMap === 'default'}
                            onClick={() => {
                                reset();
                                sync();
                            }}
                        />
                        <ButtonLabel color="primary" label="Save" disabled={form.selectedMap === 'default'} onClick={handleSave} />
                    </div>
                </div>
            </Navbar>
        </>
    );
};
