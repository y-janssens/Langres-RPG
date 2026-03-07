import { useMemo, useState, useCallback } from 'react';

import { useMapDraw } from '../../../../hooks';

import { MapGrid } from './Grid';

import css from '../../builder.module.css';

export const DrawMap = ({ form, setForm, setFormObject, world, handleSelect }) => {
    const [brush, setBrush] = useState({ x: 0, y: 0, visible: false });
    const [hoveredIds, setHoveredIds] = useState(new Set());
    const [draw, setDraw] = useState(false);

    useMapDraw({
        map: world,
        filter: true,
        tiles: hoveredIds,
        launch: draw,
        options: {
            brush: form.drawingMode.object?.name,
            density: form.drawingMode.density,
            overwrite: form.drawingMode.overwrite
        },
        onSuccess: (resp) => {
            setFormObject((prev) => {
                const content = [...prev.selectedMap.content];
                resp.forEach((item) => {
                    content[item.id] = item;
                });

                return { ...prev, selectedMap: { ...prev.selectedMap, content } };
            });
        }
    });

    const brushSize = useMemo(() => {
        const size = Number(form.drawingMode.size ?? 35);
        return Math.max(size * 3, 35);
    }, [form.drawingMode.size]);

    const gridStyle = useMemo(() => {
        const scaledTileSize = 55 * (form.zoom / 100);
        return {
            columnGap: `${Math.ceil(Math.sqrt(scaledTileSize))}px`,
            gridTemplateRows: `repeat(${world.size + Math.ceil(Math.sqrt(world.size))}, ${scaledTileSize}px)`,
            gridTemplateColumns: `repeat(${world.size}, ${scaledTileSize}px)`
        };
    }, [form.zoom, world.size]);

    const updateBrushPosition = useCallback(
        ({ currentTarget, clientX, clientY }) => {
            if (!form.drawingMode.object) return;
            const rect = currentTarget.getBoundingClientRect();
            setBrush((prev) => ({
                ...prev,
                x: clientX - rect.left,
                y: clientY - rect.top,
                clientX,
                clientY
            }));
        },
        [form.drawingMode.object]
    );

    return (
        <div
            className={[css['builder-map-grid-wrapper'], form.drawingMode.object ? css['builder-map-grid-drawing'] : ''].filter(Boolean).join(' ')}
            onMouseMove={updateBrushPosition}
            onMouseEnter={() => setBrush((prev) => ({ ...prev, visible: true }))}
            onMouseLeave={() => setBrush((prev) => ({ ...prev, visible: false }))}
            onMouseUp={() => setDraw(false)}
            onMouseDown={() => setDraw(true)}
        >
            <div className={css['builder-map-grid']} style={gridStyle}>
                <MapGrid
                    form={form}
                    data={world}
                    setForm={setForm}
                    handleSelect={handleSelect}
                    setFormObject={setFormObject}
                    setHoveredIds={setHoveredIds}
                    brush={{ ...brush, radius: brushSize / 2 }}
                />
            </div>
            {form.drawingMode.object && (
                <div
                    className={css['builder-map-brush-cursor']}
                    style={{
                        left: `${brush.x}px`,
                        top: `${brush.y}px`,
                        width: `${brushSize}px`,
                        height: `${brushSize}px`
                    }}
                >
                    <div className={css['builder-map-brush-center']} />
                </div>
            )}
        </div>
    );
};
