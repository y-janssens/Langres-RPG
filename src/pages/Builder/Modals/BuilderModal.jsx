import React, { Suspense, useMemo } from 'react';
import PropTypes from 'prop-types';

const MODALS = [
    { name: 'collections', component: React.lazy(() => import('./Collections')) },
    { name: 'gateway', component: React.lazy(() => import('./Gateway')) },
    { name: 'generator', component: React.lazy(() => import('./Generator')) },
    { name: 'manager', component: React.lazy(() => import('./Manager')) },
    { name: 'onboarding', component: React.lazy(() => import('./Onboarding')) },
    { name: 'preview', component: React.lazy(() => import('./Preview')) },
    { name: 'statistics', component: React.lazy(() => import('./Statistics')) }
];

class ModalGenerator {
    constructor(type) {
        this.type = type;
        this.types = MODALS;
        this.component = this.types.find((md) => md.name === this.type);
        this.validTypes = this.types.map((md) => md.name);
    }

    validate() {
        if (!this.component || !this.validTypes.includes(this.type)) {
            throw new Error(`${this.type} is not valid, please provide a valid modal type`);
        }
    }

    get_component() {
        this.validate();
        return this.component.component;
    }
}

const BuilderModal = ({ form, setForm, setFormObject, sync }) => {
    const { type, open, value } = useMemo(() => ({ ...form.modal }), [form.modal]);

    if (!type || !open) {
        return null;
    }
    const ActionComponent = new ModalGenerator(type).get_component();
    return (
        <Suspense>
            <ActionComponent
                type={type}
                value={value}
                form={form}
                setForm={setForm}
                setFormObject={setFormObject}
                onClose={() => setForm('modal', { type: null, open: false, value: null })}
                sync={sync}
                storyline={form.storyLine}
            />
        </Suspense>
    );
};

BuilderModal.propTypes = {
    form: PropTypes.object.isRequired,
    setForm: PropTypes.func.isRequired,
    setFormObject: PropTypes.func.isRequired,
    sync: PropTypes.func.isRequired
};

export default BuilderModal;
