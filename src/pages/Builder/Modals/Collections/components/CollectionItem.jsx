import React, { useState } from 'react';

import { MapThumbnail } from '../../Generator/Blocks';
import { SelectButton } from '../../../components/selector/Selector';

import css from '../collections.module.css';

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
export default CollectionItem;
