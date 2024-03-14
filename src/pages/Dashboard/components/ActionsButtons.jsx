import PropTypes from 'prop-types';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';

import css from './ui.module.css';

export const ActionsButtons = ({ size, onSave, onReset, onCancel }) => {
    const { t } = useTranslation();

    return (
        <div className={css['dashboard-actions-block-btns']}>
            <Button
                className={`${css['dashboard-actions-btn']} ${css['dashboard-actions-btn-cancel']}`}
                dataTheme="dark"
                size={size}
                color="default"
                variant="outline"
                onClick={onCancel}
            >
                {t('common.actions.cancel')}
            </Button>
            <Button className={css['dashboard-actions-btn']} dataTheme="dark" size={size} color="default" variant="outline" onClick={onReset}>
                {t('common.actions.reset')}
            </Button>

            <Button className={css['dashboard-actions-btn']} dataTheme="emerald" size={size} color="primary" onClick={onSave}>
                {t('common.actions.save')}
            </Button>
        </div>
    );
};

ActionsButtons.propTypes = {
    onSave: PropTypes.func,
    onReset: PropTypes.func,
    onCancel: PropTypes.func,
    size: PropTypes.string
};

ActionsButtons.defaultProps = {
    onSave: () => {},
    onReset: () => {},
    onCancel: () => {},
    size: 'sm'
};
