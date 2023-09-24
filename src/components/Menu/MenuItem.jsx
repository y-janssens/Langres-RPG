import css from './menu.module.css';

export const MenuItem = ({ name, onClick = () => {}, disabled = false }) => {
    return (
        <div className={css['menu-item']} onClick={onClick} disabled={disabled}>
            {name}
        </div>
    );
};
