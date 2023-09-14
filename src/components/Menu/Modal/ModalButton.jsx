import css from '../menu.module.css';

export const ModalButton = ({ name, onClick = () => {}, disabled = false }) => {
    return (
        <div className={css['menu-item-modal']} onClick={onClick} disabled={disabled}>
            {name}
        </div>
    );
};
