import css from './menu.module.css';

export const MenuItem = ({ active, name, onClick = () => {}, disabled = false }) => {
    return (
        <div className={css[active ? `menu-item-active` : 'menu-item']} onClick={onClick} data-disabled={disabled}>
            {name.toUpperCase()}
        </div>
    );
};
