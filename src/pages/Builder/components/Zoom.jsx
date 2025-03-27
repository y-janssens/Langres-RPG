import React, { useCallback } from 'react';

import { Icon } from '../../../components';
import { ButtonIcon } from './ButtonLabel';

import css from '../builder.module.css';

const GAP = 10;
const MIN = 40;
const MAX = 100;
const DEFAULT = 80;

const Zoom = ({ form, setObject, disabled }) => {
    const handleZoom = useCallback(
        (zoom) => {
            let newValue = form.zoom;

            switch (zoom) {
                case true:
                    newValue = Math.min(Math.max(form.zoom + GAP, MIN), MAX);
                    break;
                case false:
                    newValue = Math.min(Math.max(form.zoom - GAP, MIN), MAX);
                    break;
                case undefined:
                    newValue = DEFAULT;
                    break;
                default:
                    break;
            }

            return setObject({ ...form, zoom: newValue, showIds: Boolean(newValue > 60) });
        },
        [form]
    );

    return (
        <div className={css[`builder-navbar-zoom-${disabled ? 'inactive' : 'active'}`]}>
            <ButtonIcon icon={<Icon name="zoomin" />} disabled={disabled || form.zoom === MAX} onClick={() => handleZoom(true)} />
            <div onClick={() => handleZoom()}>{`${form.zoom}%`}</div>
            <ButtonIcon icon={<Icon name="zoomout" />} disabled={disabled || form.zoom <= MIN} onClick={() => handleZoom(false)} />
        </div>
    );
};

export default Zoom;
