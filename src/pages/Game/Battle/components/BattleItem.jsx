import { useCallback, useMemo } from 'react';

import { BattleAction } from '../../../../models';

import css from './components.module.css';

const BattleItem = ({ label, currentItem, setCurrentItem, items = [], handleClick = () => {} }) => {
    const open = useMemo(() => currentItem === label, [currentItem, label]);

    const handleToggle = useCallback(() => {
        if (!items?.length) {
            return handleClick();
        }
        setCurrentItem((prev) => {
            if (prev === label) {
                return null;
            }
            return label;
        });
    }, [items, label, handleClick]);

    return (
        <>
            <div className={css['battle-item']} onClick={handleToggle}>
                {label}
            </div>
            {open && !!items.length && (
                <div className={css['battle-items']}>
                    {items.map((item, index) => (
                        <MenuItem key={index} item={item} handleClick={handleClick} />
                    ))}
                </div>
            )}
        </>
    );
};

const MenuItem = ({ item, handleClick }) => {
    const label = useMemo(() => {
        if (item instanceof BattleAction) {
            return `Ap: ${item.cost}`;
        }
        return `Qt: ${item.quantity}`;
    }, [item]);

    return (
        <div className={css['battle-item-action']} datatype={item.disabled ? 'disabled' : null} onClick={() => handleClick(item)}>
            <span>{item.name}</span>
            <span>{label}</span>
        </div>
    );
};

export default BattleItem;
