import React, { useCallback, useMemo } from 'react';
import { useDynamicForm, useTranslation } from '../../../../hooks';
import { Storyline } from '../../../../models';
import { StoryStep, ActStep } from '../Manager/Steps';
import { BuilderModalWrapper } from '../Wrapper';

const Onboarding = ({ type, value, storyline = {}, sync, onClose }) => {
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
        switch (value) {
            case 'acts':
                return !form.acts?.filter((act) => !act.temp).length;
            case 'maps':
                return !form.selectedAct?.content.maps.filter((mp) => !mp.temp && mp.size >= 10).length;
            default:
                return true;
        }
    }, [form, value]);

    if (!form.id) {
        return null;
    }

    return (
        <BuilderModalWrapper
            title={t(`builder.modals.steps.${value}.title`)}
            subtitle={t(`builder.modals.steps.${value}.subtitle`)}
            onReset={sync}
            onSave={handleSave}
            disabled={disabled}
            canBeClosed={false}
            type={type}
        >
            {value === 'acts' ? <StoryStep form={form} setForm={setForm} /> : <ActStep form={form} setForm={setForm} onboarding />}
        </BuilderModalWrapper>
    );
};

export default Onboarding;
