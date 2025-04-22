import { Button } from 'react-daisyui';

import css from './npcs.module.css';
import { useState } from 'react';

const Section = ({ label, disabled = false, children }) => {
    const [open, setOpen] = useState(true);
    return (
        <div className={css['npc-block']}>
            <Button dataTheme="business" size="sm" color="primary" fullWidth disabled={disabled} onClick={() => setOpen((prev) => !prev)}>
                {label}
            </Button>
            {!disabled && open && children}
        </div>
    );
};

export default Section;
