import React, { useState, useCallback, Children, useMemo } from 'react';
import PropTypes from 'prop-types';
import { useTranslation } from 'react-i18next';
import { Button } from 'react-daisyui';
import css from './stepper.module.css';

export const Stepper = ({ children, handleSave }) => {
    const [step, setStep] = useState(1);

    const handleNextStep = React.useCallback(
        (stepToGo) => {
            setStep(Math.max(1, stepToGo));
        },
        [setStep]
    );

    const steps = React.useMemo(() => {
        let output = {};
        if (!Array.isArray(children)) {
            children = [children];
        }
        children
            ?.filter((child) => child !== undefined)
            .forEach((_, index) => {
                const stepIndex = index + 1;

                switch (true) {
                    case step === stepIndex:
                        output[index] = 'open';
                        break;
                    case step > stepIndex:
                        output[index] = 'done';
                        break;
                    case step < stepIndex:
                    default:
                        output[index] = 'closed';
                        break;
                }
            });

        return output;
    }, [children, step, handleNextStep]);

    return (
        <div className={css['stepper-body']}>
            {Children.toArray(children).map((child, index) => (
                <Step key={index} child={child} index={index} steps={steps} handleNextStep={handleNextStep} handleSave={handleSave} />
            ))}
        </div>
    );
};

Stepper.defaultProps = {
    children: {},
    handleSave: () => {}
};

Stepper.propTypes = {
    children: PropTypes.node,
    handleSave: PropTypes.func
};

const Step = ({ index, child, steps, handleNextStep, handleSave }) => {
    const { t } = useTranslation();
    const stepIndex = index + 1;
    const { title, subtitle } = child.props;
    const stepTitle = `${stepIndex} - ${title}`;
    const stepState = Object.values(steps)[index];

    const errors = useMemo(() => {
        if (!child.props.errors.length) {
            return false;
        }
        return child.props.errors.some((err) => err.step === title);
    }, [child, child.props, title]);

    const isLastStep = useMemo(() => {
        return Object.keys(steps).length === stepIndex;
    }, [steps, stepIndex]);

    const onChangeStep = useCallback(() => {
        if (!isLastStep) {
            return handleNextStep(stepIndex + 1);
        }
        return handleSave();
    }, [handleNextStep, handleSave, isLastStep]);

    return (
        <div className={css['stepper-card-body']}>
            <div className={css['stepper-card-header']}>
                <div>{stepTitle}</div>
                {subtitle && stepState === 'open' && <span>{subtitle}</span>}
            </div>
            {stepState === 'done' && (
                <div className={css['stepper-card-sub-header']}>
                    <span className={css['stepper-card-edit']} onClick={() => handleNextStep(stepIndex)}>
                        {t('actions.edit')}
                    </span>
                </div>
            )}
            {stepState === 'open' && (
                <>
                    <div className={css['stepper-card-content']}>{child}</div>
                    <div className={css['stepper-footer']}>
                        <Button className={css['stepper-btns']} dataTheme="dark" size="sm" color="default" variant="outline" onClick={child.props.onReset}>
                            {t('actions.reset')}
                        </Button>
                        <Button className={css['stepper-btns']} dataTheme="business" size="sm" color="primary" disabled={errors} onClick={onChangeStep}>
                            {isLastStep ? t('actions.save') : t('actions.continue')}
                        </Button>
                    </div>
                </>
            )}
        </div>
    );
};

Step.defaultProps = {
    index: 0,
    child: {},
    steps: {},
    handleNextStep: () => {},
    handleSave: () => {}
};

Step.propTypes = {
    index: PropTypes.number,
    child: PropTypes.node,
    steps: PropTypes.object,
    handleNextStep: PropTypes.func,
    handleSave: PropTypes.func
};
