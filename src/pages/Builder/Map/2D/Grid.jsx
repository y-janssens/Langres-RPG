import { useCallback, useMemo, useEffect, useRef, useState } from 'react';
import { useDragSelect } from '../../../../context';

import { Maptile } from './Tile';

export const MapGrid = ({ form, setForm, setFormObject, data, handleSelect, brush = null, setHoveredIds = () => {} }) => {
    const [hover, setHover] = useState(null);
    const tileRefs = useRef(new Map());
    const hoveredIdsRef = useRef(new Set());
    const ds = useDragSelect();

    const isStartingPoint = useCallback((item, startingPoint) => {
        return item.x / 1.5 === startingPoint.x && item.y + 2 === startingPoint.y;
    }, []);

    const objectsMap = useMemo(() => {
        return new Map(form.objects.map((obj) => [obj.value, obj]));
    }, [form.objects]);

    const npcTileIds = useMemo(() => {
        return new Set(form.selectedMap?.npcs?.map((npc) => npc.starting_point.id) || []);
    }, [form.selectedMap?.npcs]);

    const mapItems = useMemo(() => {
        if (!data.content) return [];
        return data.content.map((item) => ({
            ...item,
            start: isStartingPoint(item, data.starting_point)
        }));
    }, [data.content, data.starting_point, isStartingPoint]);

    const registerTileRef = useCallback((id, node) => {
        if (!node) {
            tileRefs.current.delete(id);
            return;
        }
        tileRefs.current.set(id, node);
    }, []);

    const isBrushHovered = useCallback(
        (id) => {
            if (!form.drawingMode.toggle || !brush?.visible) {
                return false;
            }
            const node = tileRefs.current.get(id);
            if (!node) {
                return false;
            }
            const rect = node.getBoundingClientRect();
            const deltaX = rect.left + rect.width / 2 - brush.clientX;
            const deltaY = rect.top + rect.height / 2 - brush.clientY;
            const hovered = Math.hypot(deltaX, deltaY) <= brush.radius;
            if (hovered) {
                hoveredIdsRef.current.add(id);
            }

            return hovered;
        },
        [form.drawingMode.toggle, brush]
    );

    useEffect(() => {
        if (form.drawingMode.toggle) {
            const next = new Set(hoveredIdsRef.current);
            setHoveredIds((prev) => {
                if (prev.size === next.size && [...prev].every((id) => next.has(id))) {
                    return prev;
                }
                return next;
            });
        }
    }, [setHoveredIds, form.drawingMode.toggle, brush?.clientX, brush?.clientY, brush?.visible]);

    useEffect(() => {
        if (!ds) return;
        const cb = ({ items = [] }) => {
            if (!items.length) {
                setForm('selectedTiles', []);
            }
            if (items.length > 1) {
                setForm(
                    'selectedTiles',
                    items.map((it) => it.tile)
                );
            }
        };
        ds?.subscribe('DS:end', cb);
        return () => {
            ds?.unsubscribe('DS:end', cb);
        };
    }, [ds]);

    hoveredIdsRef.current.clear();
    return mapItems?.map((item) => {
        return (
            <Maptile
                ds={ds}
                item={item}
                form={form}
                key={item.id}
                hover={hover}
                setForm={setForm}
                setHover={setHover}
                objectsMap={objectsMap}
                npcTileIds={npcTileIds}
                handleSelect={handleSelect}
                setFormObject={setFormObject}
                registerTileRef={registerTileRef}
                brushHovered={isBrushHovered(item.id)}
            />
        );
    });
};
