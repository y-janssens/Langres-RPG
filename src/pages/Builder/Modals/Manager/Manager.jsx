import React, { useCallback } from 'react';
import { Storyline } from '../../../../models';
import { useDynamicForm, useTranslation } from '../../../../hooks';

import { cloneDeep } from 'lodash';

import { Stepper } from './Stepper/Stepper';
import { ActStep, StoryStep, SummaryStep } from './Steps';
import { BuilderModalWrapper } from '../Wrapper';

const Manager = ({ open, type, storyline = {}, onClose = () => {}, sync = () => {} }) => {
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
        <BuilderModalWrapper title={t('builder.modals.manager.title')} onClose={onClose} steps type={type}>
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
        </BuilderModalWrapper>
    );
};

export default Manager;
