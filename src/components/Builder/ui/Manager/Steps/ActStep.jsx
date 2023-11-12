import React, { useCallback, useMemo, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { Button, InputGroup, Input } from 'react-daisyui';
import { SelectButton } from '../../selector/Selector';
import { useTranslation } from 'react-i18next';
import css from '../manager.module.css';

export const ActStep = ({ form, setForm }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(false);

    const maps = useMemo(() => {
        if (!form.selectedAct) {
            return [];
        }
        let list = form.selectedAct.content.maps.sort((a, b) => a.order - b.order);
        if (!list.some((act) => act.temp)) {
            list.push({ complete: false, content: [], name: '', order: list.length, size: 0, temp: true });
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

    const handleChange = useCallback(
        async (key, id, value) => {
            maps[id][key] = value;
            if (maps[id].temp && maps[id].name.length && maps[id].size && maps[id].size >= 10) {
                delete maps[id].temp;
            }
            await invoke('generate', { name: maps[id].name, size: maps[id].size, order: parseInt(maps[id].order) }).then((data) => {
                maps[id] = data;
            });
            let act = form.selectedAct;
            act.content.maps = maps;
            setForm('selectedAct', act);
        },
        [form, maps]
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
                <SelectButton label={'Select an act'} open={open} onClick={() => setOpen(!open)} size="sm" />
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
                                        placeholder="Map name"
                                        value={mp.name}
                                        onChange={(e) => handleChange('name', index, e.target.value)}
                                    />
                                    <Input
                                        className={css['manager-act-input-order']}
                                        dataTheme="dracula"
                                        size="sm"
                                        placeholder="Size"
                                        value={mp.size}
                                        onChange={(e) => handleChange('size', index, parseInt(e.target.value))}
                                    />
                                    <Input className={css['manager-act-input-order']} dataTheme="dracula" size="sm" placeholder="Order" value={mp.order} onChange={() => {}} />
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
