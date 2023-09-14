import { useMemo } from 'react';
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
