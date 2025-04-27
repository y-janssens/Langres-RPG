import React, { useMemo } from 'react';
import i18next from 'i18next';

import { useTranslation } from '../../../../../../hooks';
import { Loot } from '../../../../../../models';

import { ButtonLabel, Select } from '../../../../components';
import { Icon } from '../../../../../../components';
import Section from '../Section';

import css from '../npcs.module.css';

const Inventory = ({ index, active, handleToggle, npcForm, setNpcForm }) => {
    const { language } = i18next;
    const { t } = useTranslation();

    const [loot, loadingLoot] = Loot.useCommand();

    const options = useMemo(() => {
        if (!loot?.length || loadingLoot) {
            return [];
        }
        return loot.reduce((acc, it) => {
            const item = {
                key: it.id,
                text: (
                    <span className={css['npc-inventory-option']}>
                        <p>{it.label}</p>
                        <div>{it.stats}</div>
                    </span>
                ),
                value: it
            };
            (acc[it.item_type] ??= []).push(item);
            return acc;
        }, {});
    }, [loot, loadingLoot, language]);

    const sections = useMemo(() => {
        return [
            { key: 0, name: 'head', type: 'Equipment', item: npcForm.inventory.head },
            { key: 1, name: 'torso', type: 'Equipment', item: npcForm.inventory.torso },
            { key: 2, name: 'legs', type: 'Equipment', item: npcForm.inventory.legs },
            { key: 3, name: 'right_hand', type: 'Weapon', item: npcForm.inventory.right_hand },
            { key: 4, name: 'left_hand', type: 'Weapon', item: npcForm.inventory.left_hand }
        ];
    }, [npcForm.inventory]);

    return (
        <Section index={index} active={active} onToggle={() => handleToggle(index)} label={t('builder.modals.npc.inventory.label')} disabled={!npcForm.unique}>
            <div className={css['npc-parameters-block']}>
                {sections.map((section) => (
                    <InventorySection key={section.key} section={section} npcForm={npcForm} setNpcForm={setNpcForm} options={options} />
                ))}
            </div>
        </Section>
    );
};

const InventorySection = ({ section, npcForm, setNpcForm, options }) => {
    const { t } = useTranslation();
    const { name, item, type } = section;
    return (
        <>
            <p>{t(`builder.modals.npc.inventory.${name}`)}</p>
            <Select
                placeholder={t('builder.modals.npc.inventory.placeholder')}
                options={options[type]}
                onSelect={(value) => setNpcForm('inventory', { ...npcForm.inventory, [name]: value })}
            />
            {item && (
                <div className={css['npc-inventory-item']}>
                    <ButtonLabel
                        size="sm"
                        fullWidth
                        variant="outline"
                        animation={false}
                        label={
                            <div className={css['npc-quest-label']}>
                                <span className={css['npc-inventory-label']}>
                                    <span>{item.label}</span>
                                    <span className={css['npc-inventory-stats']}>{item.stats}</span>
                                </span>
                                <Icon name="erase" onClick={() => setNpcForm('inventory', { ...npcForm.inventory, [name]: null })} />
                            </div>
                        }
                    />
                </div>
            )}
        </>
    );
};

export default Inventory;
