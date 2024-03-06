import React, { useCallback, useMemo, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { Button, InputGroup, Input } from 'react-daisyui';
import { SelectButton } from '../../selector/Selector';
import { useTranslation } from 'react-i18next';
import css from '../manager.module.css';

export const ActStep = ({ form, setForm, ...props }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(false);

    const maps = useMemo(() => {
        if (!form.selectedAct) {
            return [];
        }
        let list = form.selectedAct.content.maps.sort((a, b) => a.order - b.order);
        if (!list.some((act) => act.temp) && list.every((mp) => mp.size >= 10)) {
            list.push({ complete: false, content: [], name: '', order: list.length, size: 0, primary: true, temp: true });
        }
        return list;
    });

    const handleSelect = useCallback((act) => {
        setForm('selectedAct', act);
        setOpen(false);
    }, []);

    const handleSort = useCallback(
        (map, id) => {
            let act = form.selectedAct;
            maps[id].order = map.order;
            map.order = id;
            if (map.temp && map.name.length && map.size > 10) {
                delete map.temp;
            }
            act.content.maps = maps;
            setForm('selectedAct', act);
        },
        [form, maps]
    );

    const handleErrors = useCallback(() => {
        if (!maps.filter((mp) => !mp.temp).some((mp) => !mp.size || mp.size === 0)) {
            return setForm('errors', []);
        }
        return setForm('errors', [{ step: props.title }]);
    }, [maps]);

    const handleChange = useCallback(
        async (key, id, value) => {
            maps[id][key] = value;
            if (maps[id].temp && maps[id].name.length && maps[id].size && maps[id].size >= 10) {
                delete maps[id].temp;
            }
            await invoke('generate', { name: maps[id].name, size: maps[id].size, order: parseInt(maps[id].order), primary: maps[id].primary }).then((data) => {
                maps[id] = data;
            });
            let act = form.selectedAct;
            act.content.maps = maps;
            setForm('selectedAct', act);
            handleErrors();
        },
        [form, maps, handleErrors]
    );

    const handleDelete = useCallback(
        (id) => {
            delete maps[id];
            maps.filter((mp) => mp.id > id).forEach((mp) => {
                mp.id--;
            });
            setForm('selectedAct', form.selectedAct);
        },
        [form, maps]
    );
    return (
        <>
            <div className={css['manager-selector-block']}>
                <SelectButton label={t('builder.selector.act')} open={open} onClick={() => setOpen(!open)} size={props.onboarding ? 'md' : 'sm'} />
                {open && (
                    <div className={css['manager-selector-content']}>
                        <ul>
                            {form.acts
                                .sort((a, b) => a.order - b.order)
                                .filter((act) => !act.temp)
                                .map((act, index) => {
                                    return (
                                        <li key={index}>
                                            <Button dataTheme="aqua" color="ghost" size="xs" fullWidth onClick={() => handleSelect(act)}>{`- ${act.name} - ${act.title}`}</Button>
                                        </li>
                                    );
                                })}
                        </ul>
                    </div>
                )}
            </div>
            {form.selectedAct && (
                <div className={css['manager-step-body']}>
                    {maps.map((mp, index) => {
                        return (
                            <div key={index} className={css['manager-act-inputs']}>
                                <InputGroup>
                                    <Input
                                        className={css['manager-act-input-name']}
                                        dataTheme="dracula"
                                        size="sm"
                                        placeholder={t('common.name')}
                                        value={mp.name}
                                        onChange={({ target: { value } }) => handleChange('name', index, value)}
                                    />
                                    <Input
                                        className={css['manager-act-input-order']}
                                        dataTheme="dracula"
                                        size="sm"
                                        placeholder={t('common.size')}
                                        value={mp.size}
                                        onChange={({ target: { value } }) => handleChange('size', index, parseInt(value))}
                                    />
                                    <Input
                                        className={css['manager-act-input-order']}
                                        dataTheme="dracula"
                                        size="sm"
                                        placeholder={t('common.order')}
                                        value={mp.order}
                                        onChange={() => {}}
                                    />
                                    <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(mp, index - 1)} disabled={index === 0 || mp.temp}>
                                        {String.fromCharCode('8593')}
                                    </Button>
                                    <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(mp, index + 1)} disabled={index === maps.length - 2 || mp.temp}>
                                        {String.fromCharCode('8595')}
                                    </Button>
                                    <Button dataTheme="autumn" color="accent" size="sm" onClick={() => handleDelete(index)}>
                                        x
                                    </Button>
                                </InputGroup>
                            </div>
                        );
                    })}
                </div>
            )}
        </>
    );
};
