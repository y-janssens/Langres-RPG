import React, { useCallback } from 'react';
import Icon from '../../../components/ui/Icon';
import { ButtonIcon } from './ButtonLabel';
import css from '../builder.module.css';

const GAP = 20;
const MIN = 40;
const MAX = 100;

const Zoom = ({ form, setValues, disabled }) => {
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
                    newValue = MAX;
                    break;
                default:
                    break;
            }

            return setValues({ ...form, zoom: newValue, showIds: Boolean(newValue > 60) });
        },
        [form]
    );

    return (
        <div className={css[`builder-navbar-zoom-${disabled ? 'inactive' : 'active'}`]}>
            <ButtonIcon icon={<Icon name="zoomin" />} size="sm" disabled={disabled || form.zoom === MAX} onClick={() => handleZoom(true)} />
            <div onClick={() => handleZoom()}>{`${form.zoom}%`}</div>
            <ButtonIcon icon={<Icon name="zoomout" />} size="sm" disabled={disabled || form.zoom <= MIN} onClick={() => handleZoom(false)} />
        </div>
    );
};

export default Zoom;
