import css from './menu.module.css';

export const MenuItem = ({ active, name, onClick = () => {}, disabled = false }) => {
    return (
        <div className={active ? css['menu-item-active'] : css['menu-item']} onClick={onClick} disabled={disabled}>
            {name.toUpperCase()}
        </div>
    );
};
