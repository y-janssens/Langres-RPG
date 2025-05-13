import PropTypes, { object, string } from 'prop-types';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';

import css from './contextual.module.css';

export const ContextualMenuWrapper = ({ title, type, onClose, children }) => {
    const { t } = useTranslation();
    const _title = title ?? t(`builder.contextuals.${type}.title`);

    return (
        <div className={css['contextual-container']}>
            <div className={css['contextual-body']}>
                <div className={css['contextual-body-header']}>
                    {_title}
                    <Button dataTheme="business" className={css['contextual-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                        x
                    </Button>
                </div>

                <div className={css['contextual-card-block']}>
                    <div className={css['contextual-card-body']}>
                        <div className={css['contextual-card-content']}>{children}</div>
                    </div>
                </div>
            </div>
        </div>
    );
};

ContextualMenuWrapper.defaultProps = {
    disabled: false,
    canBeClosed: true,
    customFooter: [],
    ctaLabel: null
};

ContextualMenuWrapper.propTypes = {
    title: PropTypes.string,
    subtitle: PropTypes.oneOfType([string, object]),
    type: PropTypes.string,
    onSave: PropTypes.func,
    onReset: PropTypes.func,
    disabled: PropTypes.bool,
    onClose: PropTypes.func,
    ctaLabel: PropTypes.string,
    customFooter: PropTypes.arrayOf(object),
    children: PropTypes.node.isRequired
};
