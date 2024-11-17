import React, { useMemo } from 'react';
import { CheckBoxComponent, InputComponent } from './components';

const TYPES = [
    { type: 'Boolean', component: CheckBoxComponent },
    { type: 'Number', component: InputComponent }
];

class SettingType {
    constructor(type) {
        this.type = type;
        this.types = TYPES;
        this.component = this.types.find((tp) => tp.type === type);
        this.validTypes = this.types.map((tp) => tp.type);
    }

    validate() {
        if (!this.component || !this.validTypes.includes(this.type)) {
            throw new Error(`${this.type} is not valid, please provide a valid type`);
        }
    }

    get_component() {
        this.validate();
        return this.component.component;
    }
}

const SettingComponent = ({ item, group, label, handleChange }) => {
    const { type } = item;

    if (!type) {
        return null;
    }
    const TypeComponent = useMemo(() => new SettingType(type).get_component(), [type]);

    return <TypeComponent item={item} group={group} label={label} handleChange={handleChange} />;
};

export default SettingComponent;
