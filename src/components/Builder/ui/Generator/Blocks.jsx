import React, { memo, useCallback, useMemo, useRef, useEffect } from 'react';
import { Loading } from '../../../ui/Loading';
import { ButtonIcon } from '../ButtonLabel';
import Icon from '../../../ui/Icon';
import css from './generator.module.css';

export const PreviewBlock = memo(({ map, index, selected, setSelect, setPreview, loading }) => {
    const blockClass = useMemo(() => {
        if (!selected.id || selected.id !== index) {
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
                {!loading && (
                    <div className={css['map-preview-actions']}>
                        <ButtonIcon icon={<Icon name="zoom" />} disabled={loading} variant={'link'} size="sm" onClick={() => setPreview(index)} />
                    </div>
                )}
                <MapThumbnail key={index} map={map} />
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

export const MapThumbnail = memo(({ map, size = 1 }) => {
    const canvasRef = useRef(null);

    const getColor = useCallback((value) => {
        switch (value) {
            case 'T':
                return 'olivedrab';
            case 'W':
                return 'lightskyblue';
            case '-':
            default:
                return 'darkkhaki';
        }
    }, []);

    const drawMap = useCallback(
        (ctx) => {
            const hexRadius = 1.165 * size;
            const hexWidth = Math.sqrt(3) * hexRadius;
            const vertDist = hexRadius * 1.5;

            map.forEach((it) => {
                ctx.fillStyle = getColor(it.value);

                const col = it.x;
                const row = it.y;
                const x = (col * hexWidth) / 2;
                const y = row * vertDist;

                ctx.beginPath();
                for (let side = 0; side < 7; side++) {
                    const angle = (Math.PI / 3) * side + Math.PI / 6;
                    ctx.lineTo(x + hexRadius * Math.cos(angle), y + hexRadius * Math.sin(angle));
                }
                ctx.closePath();
                ctx.fill();
            });
        },
        [map, size]
    );

    useEffect(() => {
        const canvas = canvasRef.current;
        const ctx = canvas.getContext('2d');
        drawMap(ctx);
    }, []);

    return <canvas ref={canvasRef} width={100 * size} height={100 * size} />;
});
