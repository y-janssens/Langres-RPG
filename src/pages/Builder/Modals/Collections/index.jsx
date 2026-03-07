import React, { useState, useCallback } from 'react';
import { useTranslation } from '../../../../hooks';
import { Collection } from '../../../../models';

import { CollectionItem } from './components';
import { BuilderModalWrapper } from '../Wrapper';

import css from './collections.module.css';

const Collections = ({ type, form, setForm, setFormObject, onClose }) => {
    const { t } = useTranslation();
    const [selectedMap, setSelectedMap] = useState(null);

    const [collections, , syncCollections] = Collection.useCommand();

    const handleApply = useCallback(() => {
        let act = { ...form.storyLine.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.maps[mapIndex] };

        newMap.content = selectedMap.map.content;
        act.maps[mapIndex] = newMap;
        setFormObject((prev) => ({ ...prev, selectedMap: newMap }));
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

    return (
        <BuilderModalWrapper
            onSave={handleApply}
            onReset={null}
            onClose={onClose}
            canBeClosed
            type={type}
            disabled={!selectedMap}
            ctaLabel={t('common.actions.apply')}
            customFooter={[
                { id: 'delete', label: t('common.actions.delete'), disabled: !selectedMap, onClick: () => handleDelete(selectedMap) },
                { id: 'new', label: t('builder.menu.functions.generate-maps'), onClick: () => setForm('modal', { type: 'generator', open: true, value: null }) }
            ]}
        >
            <div className={css['collections-modal-container']}>
                {collections?.map((coll) => (
                    <CollectionItem key={coll.id} item={coll} selected={selectedMap} setSelected={setSelectedMap} />
                ))}
            </div>
        </BuilderModalWrapper>
    );
};
export default Collections;
