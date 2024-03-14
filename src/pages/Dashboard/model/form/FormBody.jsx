import PropTypes from 'prop-types';

import { ActionsButtons } from '../../components/ActionsButtons';

import css from './form.module.css';

export const FormBody = ({ title, onSave, onReset, onCancel, children }) => {
    return (
        <div className={css['dashboard-form-container']}>
            <div className={css['dashboard-form-body']}>
                <div className={css['dashboard-form-body-header']}>{title}</div>
                <div className={css['dashboard-form-card-block']}>
                    <div className={css['dashboard-form-card-body']}>
                        <div className={css['dashboard-form-card-content']}>{children}</div>
                        <div className={css['dashboard-form-footer']}>
                            <ActionsButtons onSave={onSave} onReset={onReset} onCancel={onCancel} />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

FormBody.propTypes = {
    title: PropTypes.string,
    onSave: PropTypes.func,
    onReset: PropTypes.func,
    onCancel: PropTypes.func,
    children: PropTypes.node
};

FormBody.defaultProps = {
    title: '',
    onSave: () => {},
    onReset: () => {},
    onCancel: () => {}
};
