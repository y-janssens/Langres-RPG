import { useCallback } from 'react';
import { Toggle } from 'react-daisyui';

import css from './ui.module.css';

export const ItemToggle = ({ item, value, field, sync }) => {
    const handleCheck = useCallback(
        (checked) => {
            item[field] = checked;
            item.save().then(() => {
                sync();
            });
        },
        [item, field, sync]
    );

    return <Toggle className={css['dashboard-model-toggle']} color="success" checked={!!value} size="xs" readOnly onChange={({ target: { checked } }) => handleCheck(checked)} />;
};
