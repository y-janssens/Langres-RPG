import PropTypes from 'prop-types';

import { Button } from 'react-daisyui';
import { ActionsButtons } from '../ActionsButtons';

import css from './modal.module.css';

export const ModalBody = ({ title, onClose, onSave, onReset, children }) => {
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
                            <ActionsButtons onSave={onSave} onReset={onReset} />
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
