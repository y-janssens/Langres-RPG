import { useMemo } from 'react';
import css from './ui.module.css';

export const Button = ({ name, onClick = () => {}, disabled = false, cancel = false, modal = false }) => {
    const classname = useMemo(() => {
        if (!modal) {
            return 'ui-btn';
        }
        return 'menu-item-modal';
    }, [modal]);
    return (
        <div
            className={css[classname]}
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
