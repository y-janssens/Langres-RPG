import { Button, Form, Checkbox } from 'react-daisyui';
import css from '../builder.module.css';

export const ButtonLabel = ({ ...props }) => {
    return (
        <Button className={css['builder-header-btn']} dataTheme="business" size={'xs'} {...props}>
            {props.label}
        </Button>
    );
};

export const ButtonIcon = ({ variant = 'outline', ...props }) => {
    return (
        <Button className={css['builder-icon-btn']} dataTheme="dark" shape="square" variant={variant} color="neutral" size="sm" disabled={props.disabled} {...props}>
            {props.icon}
        </Button>
    );
};

export const ButtonToggle = ({ active = false, label = '', onClick = () => {} }) => {
    return (
        <Form className={css['builder-navbar-switch']}>
            <Form.Label title={label}>
                <Checkbox
                    className={css['builder-navbar-check']}
                    size="xs"
                    dataTheme={active ? 'forest' : 'dark'}
                    color={active ? 'primary' : 'neutral'}
                    checked={active}
                    onChange={onClick}
                />
            </Form.Label>
        </Form>
    );
};
