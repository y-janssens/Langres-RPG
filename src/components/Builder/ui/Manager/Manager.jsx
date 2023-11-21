import React, { useCallback } from 'react';
import { cloneDeep } from 'lodash';
import { Button } from 'react-daisyui';
import { Stepper } from './Stepper/Stepper';
import { useForm } from '../../../../hooks';
import { useTranslation } from 'react-i18next';
import { ActStep, StoryStep, SummaryStep } from './Steps';
import Storyline from '../../../../models/storyline';
import css from './manager.module.css';

export const Manager = ({ open = false, storyline = {}, onClose = () => {}, sync = () => {}, reset = () => {} }) => {
    const { t } = useTranslation();

    const [form, setForm] = useForm({
        id: storyline?.id,
        story: new Storyline({ ...storyline }),
        initialStory: cloneDeep({ ...storyline }),
        acts: { ...storyline }?.story?.acts,
        selectedAct: null,
        selectedMap: null,
        errors: []
    });

    const handleSave = useCallback(() => {
        const story = form.story;
        story.save().then(() => {
            sync();
            onClose();
            reset();
        });
    }, [form.story, sync, onClose, reset]);

    if (!open || !form.id) {
        return null;
    }

    return (
        <div className={css['manager-container']}>
            <div className={css['manager-body']}>
                <div className={css['manager-body-header']}>
                    {t('builder.modal.title')}
                    <Button dataTheme="business" className={css['manager-body-header-exit']} size="xs" color="secondary" shape="square" onClick={onClose}>
                        x
                    </Button>
                </div>
                <Stepper handleSave={handleSave}>
                    <StoryStep title="Storylines" subtitle="Edit and order your story's acts" onReset={() => sync()} form={form} setForm={setForm} errors={form.errors} />
                    <ActStep title="Acts" subtitle="Edit and order your acts's maps" onReset={() => sync()} form={form} setForm={setForm} errors={form.errors} />
                    <SummaryStep title="Summary" subtitle="Review and validate your changes" onReset={() => sync()} form={form} errors={form.errors} />
                </Stepper>
            </div>
        </div>
    );
};
