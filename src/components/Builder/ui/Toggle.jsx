import { Form, Checkbox } from 'react-daisyui';
import css from '../builder.module.css';

export const Toggle = ({ title, active, onChange = () => {}, disabled = false }) => {
    return (
        <Form.Label className={css['builder-navbar-toggles']} title={title}>
            <Checkbox size="xs" checked={active} onChange={onChange} disabled={disabled} />
        </Form.Label>
    );
};
