import PropTypes from 'prop-types';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';

import css from './modal.module.css';

export const ModalBody = ({ title, onClose, onSave, onReset, children }) => {
    const { t } = useTranslation();
    return (
        <div className={css['dashboard-modal-container']}>
            <div className={css['dashboard-modal-body']}>
                <div className={css['dashboard-modal-body-header']}>
                    {title}
                    <Button dataTheme="business" className={css['dashboard-modal-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                        x
                    </Button>
                </div>
                <div className={css['dashboard-modal-card-block']}>
                    <div className={css['dashboard-modal-card-body']}>
                        <div className={css['dashboard-modal-card-content']}>{children}</div>

                        <div className={css['dashboard-modal-footer']}>
                            <Button className={css['dashboard-modal-btns']} dataTheme="dark" size="sm" color="default" variant="outline" onClick={onReset}>
                                {t('common.actions.reset')}
                            </Button>

                            <Button className={css['dashboard-modal-btns']} dataTheme="emerald" size="sm" color="primary" onClick={onSave}>
                                {t('common.actions.save')}
                            </Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

ModalBody.propTypes = {
    title: PropTypes.string,
    onClose: PropTypes.func,
    onSave: PropTypes.func,
    onReset: PropTypes.func,
    children: PropTypes.node.isRequired
};

ModalBody.defaultProps = {
    title: '',
    onClose: () => {},
    onSave: () => {},
    onReset: () => {}
};
