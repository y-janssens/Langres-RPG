import React, { Suspense, useMemo } from 'react';
import PropTypes from 'prop-types';

const REGISTERED_MODALS = [
    { type: 'new_game', component: React.lazy(() => import('./NewGame')) },
    { type: 'saved_games', component: React.lazy(() => import('./SavedGames')) },
    { type: 'settings', component: React.lazy(() => import('./Settings')) }
];

class MenuModal {
    constructor(type) {
        this.type = type;
        this.modals = REGISTERED_MODALS;
        this.component = this.modals.find((tp) => tp.type === type);
        this.validModals = this.modals.map((tp) => tp.type);
    }

    validate() {
        if (!this.component || !this.validModals.includes(this.type)) {
            throw new Error(`${this.type} is not valid, please provide a valid type`);
        }
    }

    get_component() {
        this.validate();
        return this.component.component;
    }
}

const MenuModals = ({ item, onClose }) => {
    const { type, open } = item;

    if (!type) {
        return null;
    }
    const TypeComponent = useMemo(() => new MenuModal(type).get_component(), [type]);

    return <Suspense>{open && <TypeComponent onClose={onClose} />}</Suspense>;
};

MenuModals.propTypes = {
    item: PropTypes.object,
    onClose: PropTypes.func
};

MenuModals.defaultProps = {
    item: { type: null, open: false },
    onClose: () => {}
};

export default MenuModals;
