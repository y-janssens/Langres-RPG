import React, { Suspense, useCallback, useMemo } from 'react';
import PropTypes from 'prop-types';

const MENUS = [
    { name: null, component: React.lazy(() => import('./menus/Menu')), type: null, command: null, deleteItem: false },
    { name: 'informations', component: React.lazy(() => import('./menus/Informations')), type: 'informations', command: null, deleteItem: false },
    { name: 'direction', component: null, type: 'compute_direction', command: 'compute_tiles_directions', deleteItem: false },
    { name: 'erase', component: null, type: 'reset_tile', command: 'reset_tiles', deleteItem: false },
    { name: 'npc', component: null, type: 'delete_npc', command: 'delete_tiles_npcs', deleteItem: true }
];

class ContextualMenusGenerator {
    constructor(type) {
        this.type = type;
        this.types = MENUS;
        this.component = this.types.find((md) => md.name === this.type);
        this.validTypes = this.types.map((md) => md.name);
    }

    get_component() {
        return this.component.component;
    }
}

const BuilderContextualMenus = ({ form, setForm, setFormObject, sync }) => {
    const { type, open, value } = useMemo(() => ({ ...form.contextual }), [form.contextual]);

    const handleSwitch = useCallback(
        (type) => {
            setForm('contextual', { ...form.contextual, type });
        },
        [form.contextual]
    );

    const handleClose = useCallback(() => {
        setFormObject({ ...form, contextual: { type: null, open: false, value: null, position: { x: null, y: null } }, selectedTiles: [] });
    }, [form]);

    if (!open) {
        return null;
    }
    const ActionComponent = new ContextualMenusGenerator(type).get_component();
    return (
        <Suspense>
            <ActionComponent
                type={type}
                form={form}
                sync={sync}
                value={value}
                setForm={setForm}
                handleSwitch={handleSwitch}
                setFormObject={setFormObject}
                items={MENUS.filter((it) => Boolean(it.name))}
                onClose={handleClose}
            />
        </Suspense>
    );
};

BuilderContextualMenus.propTypes = {
    form: PropTypes.object.isRequired,
    setForm: PropTypes.func.isRequired,
    setFormObject: PropTypes.func.isRequired,
    sync: PropTypes.func.isRequired
};

export default BuilderContextualMenus;
