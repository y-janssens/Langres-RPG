import css from './ui.module.css';

export const Button = ({ name, onClick = () => {}, disabled = false, cancel = false }) => {
    return (
        <div
            className={css['ui-btn']}
            onClick={onClick}
            disabled={disabled}
            style={{
                filter: cancel ? 'grayscale(1)' : 'none'
            }}
        >
            {name}
        </div>
    );
};
