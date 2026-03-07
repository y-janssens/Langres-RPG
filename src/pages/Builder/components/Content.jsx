import React, { Suspense, useMemo } from 'react';

import { BuilderModal } from '../Modals';
import BuilderContextualMenus from '../Contextual/ContextualMenus';

const Map = React.lazy(() => import('../Map'));

import css from '../builder.module.css';

export const Content = ({ form, setForm, setFormObject, history, sync, loadingStoryline, index }) => {
    const display = useMemo(() => {
        if (!form.storyLine) {
            return false;
        }
        return !form.modal.type && !form.modal.open;
    }, [form.storyLine, form.modal.type, form.modal.open]);

    return (
        <div id="builder-body-block" className={css[`builder-body-container-${form.drawingMode.toggle ? 'reduced' : 'active'}`]}>
            {display && (
                <Suspense>
                    <Map history={history} index={index} loading={loadingStoryline} form={form} setForm={setForm} setFormObject={setFormObject} sync={sync} />
                </Suspense>
            )}
            <BuilderModal form={form} setForm={setForm} sync={sync} setFormObject={setFormObject} />
            <BuilderContextualMenus form={form} setForm={setForm} sync={sync} setFormObject={setFormObject} />
        </div>
    );
};
