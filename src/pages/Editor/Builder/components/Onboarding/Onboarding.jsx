import React, { useCallback, useMemo } from 'react';
import { useDynamicForm, useTranslation } from '../../../../../hooks';
import Storyline from '../../../../../models/storyline';
import { StoryStep, ActStep } from '../Manager/Steps';
import { Modal } from '..';

export const Onboarding = ({ open, type, storyline = {}, sync, onClose }) => {
    const { t } = useTranslation();

    const [form, setForm] = useDynamicForm({
        id: storyline?.id,
        story: new Storyline({ ...storyline }),
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

    const disabled = useMemo(() => {
        switch (type) {
            case 'acts':
                return !form.acts?.filter((act) => !act.temp).length;
            case 'maps':
                return !form.selectedAct?.content.maps.filter((mp) => !mp.temp && mp.size >= 10).length;
            default:
                return true;
        }
    }, [form, type]);

    if (!open || !form.id) {
        return null;
    }

    return (
        <Modal
            title={t(`builder.modals.steps.${type}.title`)}
            subtitle={t(`builder.modals.steps.${type}.subtitle`)}
            onReset={sync}
            onSave={handleSave}
            disabled={disabled}
            canBeClosed={false}
        >
            {type === 'acts' ? <StoryStep form={form} setForm={setForm} /> : <ActStep form={form} setForm={setForm} onboarding />}
        </Modal>
    );
};
