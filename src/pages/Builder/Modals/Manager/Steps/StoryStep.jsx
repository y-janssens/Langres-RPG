import React, { useCallback, useMemo } from 'react';
import { useTranslation } from 'react-i18next';
import { Button, InputGroup, Input } from 'react-daisyui';
import css from '../manager.module.css';

export const StoryStep = ({ form, setForm }) => {
    const { t } = useTranslation();

    const generateUniquePositiveId = useCallback(() => {
        const maxI32 = 2147483647;
        let uniqueId;

        do {
            uniqueId = Math.floor(Math.random() * maxI32) + 1;
        } while (form.acts.some((act) => act.id === uniqueId));

        return uniqueId;
    }, [form]);

    const acts = useMemo(() => {
        let list = form.acts.sort((a, b) => a.order - b.order);
        if (!list.some((act) => act.temp)) {
            list.push({ complete: false, maps: [], id: generateUniquePositiveId(), order: list.length, name: '', title: '', date: '', temp: true });
        }
        return list;
    }, [form, form.acts]);

    const handleSort = useCallback(
        (act, order) => {
            acts[order].order = act.order;
            act.order = order;
            if (act.temp && act.name.length && act.title.length) {
                delete act.temp;
            }
            setForm('acts', acts);
        },
        [form, acts]
    );

    const handleChange = useCallback(
        (key, order, value) => {
            acts[order][key] = value;
            if (acts[order].temp && acts[order].name.length && acts[order].title.length) {
                delete acts[order].temp;
            }
            setForm('acts', acts);
        },
        [form, acts]
    );

    const handleDelete = useCallback(
        (order) => {
            delete acts[order];
            acts.filter((act) => act.order > order).forEach((act) => {
                act.order--;
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
                                placeholder={t('common.name')}
                                value={act.name}
                                onChange={({ target: { value } }) => handleChange('name', act.order, value)}
                            />
                            <Input
                                className={css['manager-act-input-text']}
                                dataTheme="dracula"
                                size="sm"
                                placeholder={t('common.title')}
                                value={act.title}
                                onChange={({ target: { value } }) => handleChange('title', act.order, value)}
                            />
                            <Input
                                className={css['manager-act-input-text']}
                                dataTheme="dracula"
                                size="sm"
                                placeholder={t('common.date')}
                                value={act.date}
                                onChange={({ target: { value } }) => handleChange('date', act.order, value)}
                            />
                            <Input className={css['manager-act-input-order']} dataTheme="dracula" size="sm" placeholder={t('common.order')} value={act.order} onChange={() => {}} />
                            <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(act, index - 1)} disabled={index === 0 || act.temp}>
                                {String.fromCharCode('8593')}
                            </Button>
                            <Button dataTheme="dracula" color="neutral" size="sm" onClick={() => handleSort(act, index + 1)} disabled={index === acts.length - 2 || act.temp}>
                                {String.fromCharCode('8595')}
                            </Button>
                            <Button dataTheme="autumn" color="accent" size="sm" onClick={() => handleDelete(act.order)} disabled={act.temp}>
                                x
                            </Button>
                        </InputGroup>
                    </div>
                );
            })}
        </div>
    );
};
