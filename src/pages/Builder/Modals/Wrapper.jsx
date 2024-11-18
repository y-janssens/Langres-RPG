import PropTypes, { object } from 'prop-types';
import { useTranslation } from 'react-i18next';
import { Modal } from '../components';

export const BuilderModalWrapper = ({ title, subtitle, type, onSave, onReset, disabled, onClose, ctaLabel, customFooter, children, steps, canBeClosed }) => {
    const { t } = useTranslation();
    return (
        <Modal
            title={title ?? t(`builder.modals.${type}.title`)}
            subtitle={subtitle ?? t(`builder.modals.${type}.subtitle`)}
            onSave={onSave}
            onReset={onReset}
            onClose={onClose}
            canBeClosed={canBeClosed}
            disabled={disabled}
            ctaLabel={ctaLabel}
            customFooter={customFooter}
            steps={steps}
        >
            {children}
        </Modal>
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
    subtitle: PropTypes.oneOfType([PropTypes.string, PropTypes.object]),
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
