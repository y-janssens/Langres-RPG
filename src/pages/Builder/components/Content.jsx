import React, { Suspense } from 'react';

import { BuilderModal } from '../Modals';
import BuilderContextualMenus from '../Contextual/ContextualMenus';

const Map = React.lazy(() => import('../Map'));

import css from '../builder.module.css';

export const Content = ({ form, setForm, setFormObject, history, sync, loading, index }) => {
    return (
        <div id="builder-body-block" className={css[`builder-body-container-${form.drawingMode.toggle ? 'reduced' : 'active'}`]}>
            <Suspense>
                <Map history={history} index={index} loading={loading} form={form} setForm={setForm} setFormObject={setFormObject} sync={sync} />
            </Suspense>
            <BuilderModal form={form} setForm={setForm} sync={sync} setFormObject={setFormObject} />
            <BuilderContextualMenus form={form} setForm={setForm} sync={sync} setFormObject={setFormObject} />
        </div>
    );
};
