import React, { useState } from 'react';
import css from '../../ui/ui.module.css';

export const Tooltip = ({ tooltip, disabled, children }) => {
    const [hover, setHover] = useState(false);
    return (
        <>
            {hover && !disabled && <div className={css['tooltip-label']}>{tooltip}</div>}
            <div onMouseEnter={() => setHover(true)} onMouseLeave={() => setHover(false)}>
                {children}
            </div>
        </>
    );
};
