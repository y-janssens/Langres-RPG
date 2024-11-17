import { useTranslation } from 'react-i18next';
import { Button } from 'react-daisyui';
import css from './modal.module.css';

export const Modal = ({
    title = '',
    subtitle = '',
    onSave = () => {},
    onReset = () => {},
    onClose = () => {},
    disabled = false,
    steps = false,
    canBeClosed = true,
    customFooter = [],
    ctaLabel = null,
    children
}) => {
    const { t } = useTranslation();
    const saveLabel = ctaLabel ?? t('common.actions.save');

    return (
        <div className={css['modal-container']}>
            <div className={css['modal-body']}>
                <div className={css['modal-body-header']}>
                    {title}
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
                            <div className={css['modal-card-header']}>
                                <div>{subtitle}</div>
                            </div>

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
                                    >
                                        {it.label}
                                    </Button>
                                ))}
                                <Button className={css['modal-btns']} dataTheme="business" size="sm" color="primary" disabled={disabled} onClick={onSave}>
                                    {saveLabel}
                                </Button>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
};
