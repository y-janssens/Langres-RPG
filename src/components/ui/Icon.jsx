import React, { useMemo, useState } from 'react';
import * as Icons from './Icons';
import css from './ui.module.css';

function Icon({ tooltip = false, name = null, onClick, size = 'medium' }) {
    const [hover, setHover] = useState(false);

    const IconComponent = useMemo(() => {
        const icons = { ...Icons };
        let iconName = name?.charAt(0).toUpperCase() + name?.slice(1);
        try {
            return icons[iconName];
        } catch {
            console.error(`${name} icon is not registered, providing a fallback...`);
            return icons['Unknown'];
        }
    }, [name]);

    const toggleTooltip = useMemo(() => {
        if (!tooltip) {
            return false;
        }
        return hover;
    }, [tooltip, hover]);

    if (!name) {
        return null;
    }

    return (
        <span className={css[`ui-icon-${size}`]}>
            <IconComponent onClick={onClick} onMouseEnter={() => setHover(true)} onMouseLeave={() => setHover(false)} />
            {toggleTooltip && <span className="icon-tooltip">{tooltip}</span>}
        </span>
    );
}

export default Icon;
