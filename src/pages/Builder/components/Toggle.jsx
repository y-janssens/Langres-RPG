import { Form, Checkbox } from 'react-daisyui';
import { ButtonLabel } from './ButtonLabel';
import css from '../builder.module.css';

export const Toggle = ({ title, active, onChange = () => {}, disabled = false }) => {
    return (
        <Form.Label className={css['builder-navbar-toggles']} title={title}>
            <Checkbox size="xs" checked={active} onChange={onChange} disabled={disabled} />
        </Form.Label>
    );
};

export const ToggleButton = ({ title, active, onChange = () => {}, disabled = false }) => {
    return (
        <div className={css['builder-navbar-toggles-btns']}>
            <ButtonLabel color={active ? 'primary' : 'neutral'} fullWidth variant={active ? null : 'outline'} label={title} disabled={disabled} onClick={onChange} />
        </div>
    );
};
