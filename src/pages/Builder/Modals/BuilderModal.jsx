import React, { Suspense } from 'react';
import PropTypes from 'prop-types';

const MODALS = [
    { name: 'manager', component: React.lazy(() => import('./Manager')) },
    { name: 'gateway', component: React.lazy(() => import('./Gateway')) },
    { name: 'generator', component: React.lazy(() => import('./Generator')) },
    { name: 'collections', component: React.lazy(() => import('./Collections')) },
    { name: 'onboarding', component: React.lazy(() => import('./Onboarding')) }
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

const BuilderModal = ({ title, subtitle, datas, onClose, form, setForm, setFormObject, sync }) => {
    const { type, open, value } = datas;

    if (!type) {
        return null;
    }
    const ActionComponent = new ModalGenerator(type).get_component();
    return (
        <Suspense>
            {open && (
                <ActionComponent
                    title={title}
                    subtitle={subtitle}
                    type={type}
                    value={value}
                    form={form}
                    setForm={setForm}
                    setFormObject={setFormObject}
                    onClose={onClose}
                    sync={sync}
                    open={open}
                    storyline={form.storyLine}
                />
            )}
        </Suspense>
    );
};

BuilderModal.propTypes = {
    title: PropTypes.string,
    subtitle: PropTypes.string,
    datas: PropTypes.object.isRequired,
    onClose: PropTypes.func,
    form: PropTypes.object.isRequired,
    setForm: PropTypes.func.isRequired,
    setFormObject: PropTypes.func.isRequired,
    sync: PropTypes.func.isRequired
};

export default BuilderModal;
