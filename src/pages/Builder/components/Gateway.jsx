import React, { useCallback, useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Modal } from './Modal/Modal';
import { SelectButton } from './selector/Selector';
import { Button } from 'react-daisyui';
import css from './Manager/manager.module.css';
import Storyline from '../../../models/storyline';

export const Gateway = ({ form, setFormObject, open = false, onClose = () => {}, sync = () => {} }) => {
    const { t } = useTranslation();
    const [toggle, setToggle] = useState(false);
    const [selectedMap, setSelectedMap] = useState(null);

    const mapList = useMemo(() => {
        if (!form.storyLine || !form.selectedAct || !form.selectedMap) {
            return [];
        }
        return form.storyLine.story.acts.reduce((acc, act) => {
            const filteredMaps = act.content.maps.filter((mp) => mp.id !== form.selectedMap.id);
            return acc.concat(filteredMaps);
        }, []);
    }, [form]);

    const handleGateWay = useCallback(
        (map) => {
            if (!form.selectedTiles.length) {
                return;
            }
            let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
            let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
            let newMap = { ...act.content.maps[mapIndex] };

            let newContent = newMap.content.map((item) => {
                if (item.id !== form.selectedTiles[0].id) {
                    return item;
                }
                return { ...item, threshold: { map: map.id, is_final: Boolean(map.primary && form.selectedMap.primary) } };
            });

            newMap.content = newContent;
            act.content.maps[mapIndex] = newMap;

            setFormObject({ ...form, selectedMap: newMap, selectedTiles: [] });
            setToggle(false);
        },
        [form]
    );

    const handleSave = useCallback(() => {
        const datas = new Storyline(form.storyLine);
        datas.save().then(() => {
            sync();
            onClose();
        });
    }, [form, sync, onClose]);

    if (!open) {
        return null;
    }
    return (
        <Modal
            title={t('builder.modals.gateway.title')}
            subtitle={t('builder.modals.gateway.subtitle')}
            onReset={sync}
            onSave={handleSave}
            disabled={false}
            canBeClosed
            onClose={onClose}
        >
            <div className={css['manager-selector-block']}>
                <SelectButton label={selectedMap?.name || t('builder.modals.gateway.subtitle')} open={toggle} onClick={() => setToggle(!toggle)} size="sm" />
                {toggle && (
                    <div className={css['manager-selector-content']}>
                        <ul>
                            {mapList.map((map, index) => {
                                return (
                                    <li key={index}>
                                        <Button
                                            dataTheme="aqua"
                                            color="ghost"
                                            size="xs"
                                            fullWidth
                                            onClick={() => {
                                                handleGateWay(map);
                                                setSelectedMap(map);
                                            }}
                                        >
                                            {map.name}
                                        </Button>
                                    </li>
                                );
                            })}
                        </ul>
                    </div>
                )}
            </div>
        </Modal>
    );
};
