import React, { useCallback } from 'react';
import Icon from '../../../components/ui/Icon';
import { ButtonIcon } from './ButtonLabel';
import css from '../builder.module.css';

const Zoom = ({ form, setValues, disabled }) => {
    const handleZoom = useCallback(
        (zoom) => {
            let newValue = form.zoom;

            switch (zoom) {
                case true:
                    newValue = Math.min(Math.max(form.zoom + 10, 50), 100);
                    break;
                case false:
                    newValue = Math.min(Math.max(form.zoom - 10, 50), 100);
                    break;
                case undefined:
                    newValue = 100;
                    break;
                default:
                    break;
            }

            return setValues({ ...form, zoom: newValue, showIds: Boolean(newValue > 70) });
        },
        [form]
    );

    return (
        <div className={css[`builder-navbar-zoom-${disabled ? 'inactive' : 'active'}`]}>
            <ButtonIcon icon={<Icon name="zoomin" />} size="sm" disabled={disabled || form.zoom === 100} onClick={() => handleZoom(true)} />
            <div onClick={() => handleZoom()}>{`${form.zoom}%`}</div>
            <ButtonIcon icon={<Icon name="zoomout" />} size="sm" disabled={disabled || form.zoom <= 50} onClick={() => handleZoom(false)} />
        </div>
    );
};

export default Zoom;
