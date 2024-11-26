import { useMemo } from 'react';

import { Range } from 'react-daisyui';
import Icon from './Icon';

import css from './ui.module.css';

export const Gauge = ({ stat, max, type }) => {
    const fill = useMemo(() => {
        return `${(stat / max) * 100}%`;
    }, [stat, max]);
    return (
        <div
            className={css['gauge-container']}
            style={{
                height: type === 'pv' ? '12px' : '8px',
                border: `${type === 'pv' ? 1.5 : 1}px solid #3d332f`
            }}
        >
            <span
                className={css['gauge-content']}
                style={{
                    width: fill,
                    backgroundColor: type === 'pv' ? 'red' : 'blue'
                }}
            />
            <p>{`${stat}/${max}`}</p>
        </div>
    );
};

export const XpGauge = ({ stat, max }) => {
    const fill = useMemo(() => {
        return `${(stat / max) * 100}%`;
    }, [stat, max]);
    return (
        <div
            className={css['gauge-container']}
            style={{
                width: '75%',
                height: '8px',
                border: `1px solid #3d332f`
            }}
        >
            <span
                className={css['gauge-content']}
                style={{
                    width: fill,
                    backgroundColor: '#32328b'
                }}
            />
            <p>{`${stat}/${max} xp`}</p>
        </div>
    );
};

export function VolumeBar({ name, stat, disabled = false, onChange = () => {} }) {
    const volumeLevel = useMemo(() => {
        if (!stat || stat === 0 || disabled) {
            return 'mute';
        }

        return stat > 0 && stat <= 50 ? 'medium' : 'volume';
    }, [stat, disabled]);

    return (
        <>
            <Icon name={volumeLevel} color="white" size="large" />
            <div className={css['volume-container']}>
                <Range dataTheme="sunset" size="xs" color="info" value={stat} onChange={({ target: { value } }) => onChange(name, Number(value))} disabled={disabled} />
            </div>
            <span className={css['volume-level']}>{disabled ? 0 : stat}</span>
        </>
    );
}
