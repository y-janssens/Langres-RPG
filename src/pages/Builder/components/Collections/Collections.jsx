import React, { useState, useCallback } from 'react';
import { useTranslation } from '../../../../hooks';
import { Collection } from '../../../../models';

import { Modal } from '../Modal/Modal';
import { SelectButton } from '../selector/Selector';
import { MapThumbnail } from '../Generator/Blocks';

import css from './collections.module.css';

export const Collections = ({ open, form, setFormObject, onClose }) => {
    const { t } = useTranslation();
    const [selectedMap, setSelectedMap] = useState(null);

    const [collections, , syncCollections] = Collection.useCommand({
        launch: open
    });

    const handleApply = useCallback(() => {
        let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.content.maps[mapIndex] };

        newMap.content = selectedMap.map.content;
        act.content.maps[mapIndex] = newMap;
        setFormObject({ ...form, selectedMap: newMap });
        onClose();
    }, [form, selectedMap, onClose]);

    const handleDelete = useCallback(
        (item) => {
            item.delete().then(() => {
                setSelectedMap(null);
                syncCollections();
            });
        },
        [syncCollections]
    );

    if (!open) {
        return null;
    }

    return (
        <Modal
            title={t('builder.modals.collections.title')}
            subtitle={t('builder.modals.collections.subtitle')}
            onSave={handleApply}
            onReset={null}
            onClose={onClose}
            canBeClosed
            disabled={!selectedMap}
            ctaLabel={t('common.actions.apply')}
            customFooter={[
                { id: 'delete', label: t('common.actions.delete'), disabled: !selectedMap, onClick: () => handleDelete(selectedMap) },
                { id: 'new', label: t('builder.menu.functions.generate-maps'), onClick: () => setFormObject({ ...form, modalCollection: false, modalGenerator: true }) },
            ]}
        >
            <div className={css['collections-modal-container']}>
                {collections?.map((coll) => (
                    <CollectionItem key={coll.id} item={coll} selected={selectedMap} setSelected={setSelectedMap} />
                ))}
            </div>
        </Modal>
    );
};

const CollectionItem = ({ item, selected, setSelected }) => {
    const [open, setOpen] = useState(false);
    const label = `${item.id} - ${item.map.id} - ${item.created.split(' ')[0]}`;

    return (
        <div className={css['collection-item']}>
            <SelectButton
                open={open}
                label={label}
                onClick={() => {
                    setOpen(!open);
                    setSelected(null);
                }}
            />
            {open && (
                <div className={css[`collection-content-${selected?.id === item.id ? 'active' : 'inactive'}`]} onClick={() => setSelected(selected?.id === item.id ? null : item)}>
                    <MapThumbnail map={item.map} size={3} />
                </div>
            )}
        </div>
    );
};
