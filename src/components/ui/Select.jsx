import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { useTranslation } from 'react-i18next';
import { resolveOptions } from '../utils';

import { Button } from 'react-daisyui';

import css from './ui.module.css';

export const Select = ({ label, value, options, onChange }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(false);

    return (
        <div className={css['ui-selector']}>
            <Button
                dataTheme="dark"
                animation={false}
                fullWidth
                onClick={() => setOpen(!open)}
                style={{
                    boxShadow: !open && '0 2px 2px rgba(0, 0, 0, 0.2)',
                    borderBottomRightRadius: open && '0px',
                    borderBottomLeftRadius: open && '0px'
                }}
            >
                <div className={css['ui-selector-label']}>
                    <span>{value || t(label)}</span>
                    <span className={css['ui-selector-chevron']}>{String.fromCharCode(open ? '9650' : '9660')}</span>
                </div>
            </Button>
            {open && (
                <div className={css['ui-selector-content']}>
                    <div className={css['ui-selector-options']}>
                        {resolveOptions(options).map((it) => (
                            <Option key={it.key} item={it} onClick={onChange} onclose={() => setOpen(false)} />
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
};

const Option = ({ item, onClick, onclose }) => {
    return (
        <div
            className={css['ui-selector-option']}
            onClick={() => {
                onClick(item.value);
                onclose();
            }}
        >
            {item.text}
        </div>
    );
};

Select.defaultProps = {
    label: 'common.actions.select',
    onChange: () => {},
    options: [],
    value: ''
};

Select.propTypes = {
    label: PropTypes.string,
    onChange: PropTypes.func,
    options: PropTypes.array,
    value: PropTypes.string
};
