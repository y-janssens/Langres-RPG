import React, { useMemo, useState } from 'react';
import * as Icons from './Icons';
import css from './ui.module.css';

function Icon({ tooltip = false, name = null, color = '#000', onClick, size = 'medium' }) {
    const [hover, setHover] = useState(false);

    const IconComponent = useMemo(() => {
        const icons = { ...Icons };
        let iconName = name?.charAt(0).toUpperCase() + name?.slice(1);

        return icons[iconName];
    }, [name]);

    const iconSize = useMemo(() => {
        switch (size) {
            case 'medium':
                return 16;
            case 'large':
                return 22;
            case 'small':
                return 12;
        }
    }, [size]);

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
        <span className={css['ui-icon']}>
            <IconComponent
                onClick={onClick}
                style={{ fill: color, fontSize: `${iconSize}px`, cursor: 'pointer' }}
                onMouseEnter={() => setHover(true)}
                onMouseLeave={() => setHover(false)}
            />
            {toggleTooltip && <span className="icon-tooltip"> {tooltip}</span>}
        </span>
    );
}

export default Icon;
