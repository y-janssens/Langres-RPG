import { Checkbox } from 'react-daisyui';

import css from './settings.module.css';

export const CheckBoxComponent = ({ item, group, label, handleChange }) => {
    return <Checkbox size="xs" checked={item.value} disabled={!item.mutable} onChange={() => handleChange(group, label, !item.value)} />;
};

export const InputComponent = ({ item, group, label, handleChange }) => {
    return (
        <div className={css['step-input']}>
            <input
                type="number"
                step={item.step}
                min="0"
                value={item.value}
                disabled={!item.mutable}
                onChange={({ target: { value } }) => handleChange(group, label, Number(value))}
            />
        </div>
    );
};
