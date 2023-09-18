import { useCallback, useMemo, useState } from 'react';
import Draggable from 'react-draggable';
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

export function VolumeBar({ stat, max = 100, disabled = false, onChange = () => {} }) {
    const [drag, setDrag] = useState(false);
    const [volume, setVolume] = useState(stat);

    const fill = useMemo(() => {
        return `${(volume / max) * 100}%`;
    }, [volume, max]);

    const volumeLevel = useMemo(() => {
        if (!volume || volume === 0 || disabled) {
            return 'mute';
        }

        return volume > 0 && volume <= 50 ? 'medium' : 'volume';
    }, [volume, disabled]);

    console.log(volumeLevel);

    const handleVolume = useCallback(
        (e, vol) => {
            if (drag) {
                if (vol.x >= -100 && vol.x <= 0) {
                    const newVolume = 100 - Math.abs(vol.x);
                    setVolume(newVolume >= 99 ? Math.ceil(newVolume) : Math.round(newVolume));
                    onChange();
                }
            }
        },
        [drag, onChange]
    );

    return (
        <>
            <Icon name={volumeLevel} color="white" size="large" />
            <div className={css['volume-container']}>
                <Draggable
                    disabled={disabled}
                    defaultPosition={{ x: 0, y: 0 }}
                    scale={1.4}
                    axis="none"
                    onDrag={handleVolume}
                    onStart={() => setDrag(true)}
                    onStop={() => setDrag(false)}
                >
                    <span
                        className={css['volume-content']}
                        style={{
                            width: disabled ? '0%' : fill
                        }}
                        onDragStart={(e) => console.log(e)}
                    />
                </Draggable>
            </div>
            <span className={css['volume-level']}>{disabled ? 0 : volume}</span>
        </>
    );
}
