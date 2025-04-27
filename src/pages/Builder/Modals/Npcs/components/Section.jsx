import { useMemo, useState } from 'react';

import { Button } from 'react-daisyui';

import css from './npcs.module.css';

const Section = ({ index, label, active, onToggle, disabled = false, children }) => {
    const open = useMemo(() => !disabled && active, [disabled, active]);
    return (
        <div className={css['npc-section']}>
            <Button dataTheme="business" size="sm" color="primary" animation={false} fullWidth disabled={disabled} onClick={onToggle}>
                {`${index + 1} - ${label}`}
            </Button>
            {open && children}
        </div>
    );
};

export const SubSection = ({ label, children, active = true }) => {
    const [open, setOpen] = useState(active);
    return (
        <div className={css['npc-sub-section']}>
            <Button dataTheme="corporate" size="sm" color="secondary" fullWidth onClick={() => setOpen((prev) => !prev)}>
                {label}
            </Button>
            {open && <div className={css['npc-sub-section-content']}>{children}</div>}
        </div>
    );
};

export default Section;
