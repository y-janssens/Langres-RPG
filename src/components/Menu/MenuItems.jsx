import { MenuItem } from './MenuItem';

import css from './menu.module.css';

export const MenuItems = ({ items, selected }) => {
    return (
        <div className={css['menu-items-container']}>
            <div className={css['menu-items-block']}>
                {items?.map((it) => {
                    return <MenuItem active={selected === it.key} key={it.key} name={it.name} onClick={it.onClick} />;
                })}
            </div>
        </div>
    );
};
