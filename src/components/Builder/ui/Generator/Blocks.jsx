import React, { memo, useCallback, useMemo } from 'react';
import { Loading } from '../../../ui/Loading';
import css from './generator.module.css';

export const PreviewBlock = memo(({ map, index, selected, setSelect }) => {
    const blockClass = useMemo(() => {
        if (!selected.map || selected.id !== index) {
            return 'map-preview-content';
        }
        return 'map-preview-selected';
    }, [selected, index]);

    const handleSelect = useCallback(
        ({ id, map }) => {
            if (selected?.id === id) {
                return setSelect({ id: null, map: null });
            } else {
                return setSelect({ id, map });
            }
        },
        [selected]
    );
    return (
        <div className={css['map-preview-item']}>
            <span>{`Map_${index}`}</span>
            <div className={css[blockClass]} onClick={() => handleSelect({ id: index, map })}>
                {map.map((it) => (
                    <span key={it.id} className={css[`map-preview-px_${it.value}`]} />
                ))}
            </div>
        </div>
    );
});

export const EmptyBlock = memo(({ index }) => {
    return (
        <div className={css['map-preview-item']}>
            <span>{`Map_${index}`}</span>
            <div className={css['map-preview-loading']}>
                <Loading loading text={false} scale={0.5} />
            </div>
        </div>
    );
});
