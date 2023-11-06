import React, { useCallback, useMemo } from 'react';
import { Button, InputGroup, Input } from 'react-daisyui';
import css from '../manager.module.css';

export const StoryStep = ({ form, setForm }) => {
    const acts = useMemo(() => {
        let list = form.acts.sort((a, b) => a.id - b.id);
        if (!list.some((act) => act.temp)) {
            list.push({ complete: false, content: { maps: [] }, id: list.length, name: '', title: '', temp: true });
        }
        return list;
    }, [form, form.acts]);

    const handleSort = useCallback(
        (act, id) => {
            acts[id].id = act.id;
            act.id = id;
            if (act.temp && act.name.length && act.title.length) {
                delete act.temp;
            }
            setForm('acts', acts);
        },
        [form, acts]
    );

    const handleChange = useCallback(
        (key, id, value) => {
            acts[id][key] = value;
            if (acts[id].temp && acts[id].name.length && acts[id].title.length) {
                delete acts[id].temp;
            }
            setForm('acts', acts);
        },
        [form, acts]
    );

    const handleDelete = useCallback(
        (id) => {
            delete acts[id];
            acts.filter((act) => act.id > id).forEach((act) => {
                act.id--;
            });
            setForm('acts', acts);
        },
        [form, acts]
    );

    return (
        <div className={css['manager-step-body']}>
            {acts.map((act, index) => {
                return (
                    <div
                        key={index}
                        className={css['manager-act-inputs']}
                        style={{
                            opacity: act.temp && !act.name && !act.title && '0.5'
                        }}
                    >
                        <InputGroup>
                            <Input
                                className={css['manager-act-input-text']}
                                dataTheme="dracula"
                                size="sm"
                                placeholder="Map name"
                                value={act.name}
                                onChange={(e) => handleChange('name', act.id, e.target.value)}
                            />
                            <Input
                                className={css['manager-act-input-text']}
                                dataTheme="dracula"
                                size="sm"
                                placeholder="Map title"
                                value={act.title}
                                onChange={(e) => handleChange('title', act.id, e.target.value)}
                            />
                            <Input className={css['manager-act-input-order']} dataTheme="dracula" size="sm" placeholder="Order" value={act.id} onChange={() => {}} />
                            <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(act, index - 1)} disabled={index === 0 || act.temp}>
                                {String.fromCharCode('8593')}
                            </Button>
                            <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(act, index + 1)} disabled={index === acts.length - 2 || act.temp}>
                                {String.fromCharCode('8595')}
                            </Button>
                            <Button dataTheme="autumn" color="accent" size="sm" onClick={() => handleDelete(act.id)} disabled={act.temp}>
                                x
                            </Button>
                        </InputGroup>
                    </div>
                );
            })}
        </div>
    );
};
