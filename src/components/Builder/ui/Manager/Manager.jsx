import React, { useCallback } from 'react';
import { cloneDeep } from 'lodash';
import { Button } from 'react-daisyui';
import { Stepper } from './Stepper/Stepper';
import { useDynamicForm } from '../../../../hooks';
import { useTranslation } from 'react-i18next';
import { ActStep, StoryStep, SummaryStep } from './Steps';
import Storyline from '../../../../models/storyline';
import css from './manager.module.css';

export const Manager = ({ open, storyline = {}, onClose = () => {}, sync = () => {} }) => {
    const { t } = useTranslation();

    const [form, setForm] = useDynamicForm({
        id: storyline?.id,
        story: new Storyline({ ...storyline }),
        initialStory: cloneDeep({ ...storyline }),
        acts: { ...storyline }?.story?.acts,
        selectedAct: null,
        selectedMap: null,
        errors: []
    });

    const handleSave = useCallback(() => {
        form.story.save().then(() => {
            sync();
            onClose();
        });
    }, [form, sync, onClose]);

    if (!open || !form.id) {
        return null;
    }

    return (
        <div className={css['manager-container']}>
            <div className={css['manager-body']}>
                <div className={css['manager-body-header']}>
                    {t('builder.modals.manager.title')}
                    <Button dataTheme="business" className={css['manager-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                        x
                    </Button>
                </div>
                <Stepper handleSave={handleSave}>
                    <StoryStep
                        title={t(`builder.modals.steps.acts.title`)}
                        subtitle={t(`builder.modals.steps.acts.subtitle`)}
                        onReset={() => sync()}
                        form={form}
                        setForm={setForm}
                        errors={form.errors}
                    />
                    <ActStep
                        title={t(`builder.modals.steps.maps.title`)}
                        subtitle={t(`builder.modals.steps.maps.subtitle`)}
                        onReset={() => sync()}
                        form={form}
                        setForm={setForm}
                        errors={form.errors}
                    />
                    <SummaryStep
                        title={t(`builder.modals.steps.summary.title`)}
                        subtitle={t(`builder.modals.steps.summary.subtitle`)}
                        onReset={() => sync()}
                        form={form}
                        errors={form.errors}
                    />
                </Stepper>
            </div>
        </div>
    );
};
