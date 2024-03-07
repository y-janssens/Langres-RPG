import { useMemo } from 'react';
import css from './character.module.css';

export const Character = ({ display = false, character }) => {
    const inventoryItems = useMemo(() => {
        let items = [];
        for (let i = 0; i < 24; i++) {
            items.push({ id: i, item: null, icon: `/assets/inventory/${i}.png` });
        }
        if (character.inventory.objects.length) {
            character.inventory.objects.map((item, index) => {
                return (items[index] = item);
            });
        }
        return items;
    }, [character]);

    if (!display) {
        return null;
    }
    return (
        <div className={css['character-screen-container']}>
            <div className={css['character-screen-block']}>
                <InventoryGrid items={inventoryItems} />
            </div>
        </div>
    );
};

function InventoryGrid({ items = [] }) {
    return (
        <div className={css['inventory-block']}>
            <div className={css['inventory-grid']}>
                {items.map((it) => {
                    return (
                        <div key={it.id} className={css['inventory-grid-item']}>
                            <div className={css[`${it.item ? 'active' : 'empty'}`]}></div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
