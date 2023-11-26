import React, { useCallback, useMemo } from 'react';
import { useTranslation } from 'react-i18next';
import { useDynamicForm } from '../../../../hooks';
import Storyline from '../../../../models/storyline';
import { StoryStep, ActStep } from '../Manager/Steps';
import { Button } from 'react-daisyui';
import css from '../Editor/editor.module.css';

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
                return !form.acts.filter((act) => !act.temp).length;
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
        <div className={css['editor-container']}>
            <div className={css['editor-body']}>
                <div className={css['editor-body-header']}>{t(`builder.modals.steps.${type}.title`)}</div>
                <div className={css['editor-card-block']}>
                    <div className={css['editor-card-body']}>
                        <div className={css['editor-card-header']}>
                            <div>{t(`builder.modals.steps.${type}.subtitle`)}</div>
                        </div>

                        <div className={css['editor-card-content']}>
                            <div className={css['builder-json-editor']}>
                                {type === 'acts' ? <StoryStep form={form} setForm={setForm} /> : <ActStep form={form} setForm={setForm} onboarding />}
                            </div>
                        </div>

                        <div className={css['editor-footer']}>
                            <Button className={css['editor-btns']} dataTheme="dark" size="sm" color="default" variant="outline" disabled={disabled} onClick={sync}>
                                {t('actions.reset')}
                            </Button>
                            <Button className={css['editor-btns']} dataTheme="business" size="sm" color="primary" disabled={disabled} onClick={handleSave}>
                                {t('actions.save')}
                            </Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};
