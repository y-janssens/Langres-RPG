import React, { Suspense } from 'react';

import css from '../components/components.module.css';

const LOGS = [
    { name: 'Action', component: React.lazy(() => import('./types/Action')) },
    { name: 'Alteration', component: React.lazy(() => import('./types/Alteration')) },
    { name: 'Damage', component: React.lazy(() => import('./types/Damage')) },
    { name: 'Heal', component: React.lazy(() => import('./types/Heal')) },
    { name: 'Location', component: React.lazy(() => import('./types/Location')) },
    { name: 'Object', component: React.lazy(() => import('./types/Object')) },
    { name: 'Stand', component: React.lazy(() => import('./types/Stand')) },
    { name: 'State', component: React.lazy(() => import('./types/State')) }
];

class HistoryBuilder {
    constructor(type) {
        this.type = type;
        this.types = LOGS;
        this.component = this.types.find((md) => md.name === this.type);
        this.validTypes = this.types.map((md) => md.name);
    }

    validate() {
        if (!this.component || !this.validTypes.includes(this.type)) {
            throw new Error(`${this.type} is not valid, please provide a valid log type`);
        }
    }

    get_component() {
        this.validate();
        return this.component.component;
    }
}

const HistoryLog = ({ log }) => {
    const { type } = log;

    if (!type) {
        return null;
    }
    const ActionComponent = new HistoryBuilder(type).get_component();
    return (
        <Suspense>
            <ActionComponent log={log} />
        </Suspense>
    );
};

export const HistoryWrapper = ({ log, children }) => {
    return <div className={`${css['battle-history-item']} ${css[`battle-history-item-${log.initiator.toLowerCase()}`]}`}>{children}</div>;
};

export default HistoryLog;
