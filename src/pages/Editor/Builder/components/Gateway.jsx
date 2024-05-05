import React, { useCallback, useMemo, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { useTranslation } from 'react-i18next';
import { Modal } from './Modal/Modal';
import { SelectButton } from './selector/Selector';
import { Button } from 'react-daisyui';
import css from './Manager/manager.module.css';

export const Gateway = ({ form, open = false, onClose = () => {}, sync = () => {} }) => {
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

    const findGateway = useCallback(() => {
        if (!form.selectedTiles[0].events.some((ev) => Object.keys(ev.type)[0] === 'GateWay')) {
            return selectedMap.id;
        }
        const actualGateway = form.selectedTiles[0].events.find((ev) => Object.keys(ev.type)[0] === 'GateWay');

        if (actualGateway.type['GateWay'][0] === selectedMap.id) {
            return null;
        }
        return selectedMap.id;
    }, [selectedMap]);

    const handleSave = useCallback(async () => {
        await invoke('register_gateway', {
            actId: form.selectedAct.id,
            mapId: form.selectedMap.id,
            tileId: form.selectedTiles[0].id,
            gateway: [findGateway(), selectedMap.primary]
        })
            .then(() => {
                sync();
            })
            .finally(() => {
                onClose();
            });
    }, [selectedMap, form, sync, onClose, findGateway]);

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
                                                // handleGateWay(map);
                                                setSelectedMap(map);
                                                setToggle(false);
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
