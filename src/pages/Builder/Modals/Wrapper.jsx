import PropTypes, { object, string } from 'prop-types';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';

import css from './modal.module.css';

export const BuilderModalWrapper = ({
    title,
    subtitle,
    type,
    onSave,
    onReset,
    disabled,
    onClose,
    ctaLabel,
    customFooter,
    children,
    steps,
    canBeClosed,
    displayFooter = true,
    displaySubtitle = true
}) => {
    const { t } = useTranslation();
    const _title = title ?? t(`builder.modals.${type}.title`);
    const _subtitle = subtitle ?? t(`builder.modals.${type}.subtitle`);
    const _ctaLabel = ctaLabel ?? t('common.actions.save');

    return (
        <div className={css['modal-container']}>
            <div className={css['modal-body']}>
                <div className={css['modal-body-header']}>
                    {_title}
                    {canBeClosed && (
                        <Button dataTheme="business" className={css['modal-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                            x
                        </Button>
                    )}
                </div>
                {steps ? (
                    children
                ) : (
                    <div className={css['modal-card-block']}>
                        <div className={css['modal-card-body']}>
                            {displaySubtitle && (
                                <div className={css['modal-card-header']}>
                                    <div className={css['modal-card-header-subtitle']}>{_subtitle}</div>
                                </div>
                            )}

                            <div className={css['modal-card-content']}>{children}</div>

                            <div className={css['modal-footer']}>
                                {onReset && (
                                    <Button className={css['modal-btns']} dataTheme="dark" size="sm" color="default" variant="outline" disabled={disabled} onClick={onReset}>
                                        {t('common.actions.reset')}
                                    </Button>
                                )}
                                {customFooter?.map((it) => (
                                    <Button
                                        key={it.id}
                                        className={css['modal-btns']}
                                        dataTheme="dark"
                                        size="sm"
                                        color="default"
                                        variant="outline"
                                        disabled={it.disabled}
                                        onClick={it.onClick}
                                        {...it}
                                    >
                                        {it.label}
                                    </Button>
                                ))}
                                {displayFooter && (
                                    <Button className={css['modal-btns']} dataTheme="business" size="sm" color="primary" disabled={disabled} onClick={onSave}>
                                        {_ctaLabel}
                                    </Button>
                                )}
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
};

BuilderModalWrapper.defaultProps = {
    disabled: false,
    canBeClosed: true,
    customFooter: [],
    steps: false,
    ctaLabel: null
};

BuilderModalWrapper.propTypes = {
    title: PropTypes.string,
    subtitle: PropTypes.oneOfType([string, object]),
    type: PropTypes.string.isRequired,
    onSave: PropTypes.func,
    onReset: PropTypes.func,
    disabled: PropTypes.bool,
    canBeClosed: PropTypes.bool,
    onClose: PropTypes.func,
    ctaLabel: PropTypes.string,
    customFooter: PropTypes.arrayOf(object),
    children: PropTypes.node.isRequired,
    steps: PropTypes.bool
};
