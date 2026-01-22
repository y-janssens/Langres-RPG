import React, { useCallback, useMemo, useRef, useEffect } from 'react';
import { invoke } from '@tauri-apps/api/core';

import { Icon, Hex } from '../../../../components';

import css from '../../builder.module.css';

export const Maptile = React.memo(({ form, setForm, setFormObject, hover, setHover, ds, item, handleSelect }) => {
    const tileRef = useRef();

    const active = useMemo(() => {
        if (!form.selectedTiles.length || form.interactiveMode.toggle) {
            return false;
        }
        return form.selectedTiles.find((tile) => tile.id === item.id);
    }, [item.id, form.selectedTiles, form.interactiveMode.toggle]);

    const icon = useMemo(() => {
        const name = form.objects.find((it) => it.value === item.value)?.name;
        if (name === 'clear') {
            return null;
        }
        if (form.selectedMap.npcs.some((npc) => npc.starting_point.id === item.id)) {
            return 'npc';
        }
        return name;
    }, [form.objects, form.selectedMap.npcs, item.value, item.id]);

    const isGateway = useMemo(() => {
        if (!item.events.length) {
            return false;
        }
        return item.events.some((ev) => Object.keys(ev.type)[0] === 'GateWay');
    }, [item]);

    const filters = useMemo(() => {
        if (!item.start && !isGateway) {
            return 'unset';
        }
        return `hue-rotate(${item.start ? '-25deg' : '25deg'}) brightness(1.25) saturate(1.5)`;
    }, [item, isGateway]);

    const className = useMemo(() => {
        let cls = active ? 'builder-map-tile-active' : 'builder-map-tile';
        if (!form.interactiveMode.isValid && !item.walkable && (form.interactiveMode.neighours?.includes(item.id) || hover === item.id)) {
            cls = `${cls}, builder-map-tile-invalid`;
        }
        return cls;
    }, [hover, item, form.interactiveMode]);

    const color = useMemo(() => {
        if (!form.showConstraints) {
            if (form.selectedMap.npcs.some((npc) => npc.starting_point.id === item.id)) {
                return '#B22222';
            }
            return item.display_color;
        }

        if (Boolean(hover) && hover === item.id) {
            return '#019ae6';
        }

        if (form.interactiveMode) {
            if (form.interactiveMode.neighours?.includes(item.id) && item.walkable) {
                return 'rgba(1, 154, 230, .5)';
            }
        }
        return item.walkable ? '#909090' : '#404040';
    }, [form.showConstraints, form.interactiveMode, form.selectedMap.npcs, form.interactiveMode, item.id, item.display_color, item.walkable, hover]);

    const handleHover = useCallback(
        async (_hover) => {
            if (_hover && form.interactiveMode.toggle) {
                await invoke('get_neighbours_ids', {
                    actId: form.selectedAct.id,
                    mapId: form.selectedMap.id,
                    tileId: item.id,
                    objectId: form.interactiveMode.object.id
                }).then((response) => {
                    setHover(item.id);
                    setForm('interactiveMode', {
                        toggle: form.interactiveMode.toggle,
                        object: form.interactiveMode.object,
                        neighours: response,
                        isValid: form.selectedMap.content.filter((it) => response.includes(it.id)).every((it) => it.walkable)
                    });
                });
            } else {
                if (hover === item.id) {
                    setHover(null);
                    setForm('interactiveMode', {
                        toggle: form.interactiveMode.toggle,
                        object: form.interactiveMode.object,
                        neighours: []
                    });
                }
            }
        },
        [form.interactiveMode.toggle, form.selectedAct.id, form.selectedMap.id, item.id, hover, setHover, setForm]
    );

    const tileStyle = useMemo(() => {
        const scaledSize = form.zoom / 100;
        return {
            filter: filters,
            backgroundColor: color,
            marginLeft: item.y % 2 === 0 ? `${30 * scaledSize + 1}px` : undefined,
            height: `${70 * scaledSize}px`,
            width: `${((70 * Math.sqrt(3)) / 2) * scaledSize}px`
        };
    }, [filters, color, item.y, form.zoom]);

    useEffect(() => {
        const element = tileRef.current;
        if (!element || !ds) return;
        element.tile = item;
        ds.addSelectables(element);
    }, [ds, tileRef, item]);

    return (
        <div
            className={[
                css[active ? 'builder-map-tile-active' : 'builder-map-tile'],
                css[!form.interactiveMode.isValid ? 'builder-map-tile-invalid' : ''],
                css[!form.interactiveMode.isValid && form.interactiveMode.neighours?.includes(item.id) && !item.walkable ? 'builder-map-tile-forbidden' : '']
            ]
                .filter(Boolean)
                .join(' ')}
            ref={tileRef}
            onClick={() => handleSelect(item)}
            onMouseEnter={() => handleHover(true)}
            onMouseLeave={() => handleHover(false)}
            onContextMenu={(e) => {
                e.preventDefault();
                e.stopPropagation();
                setFormObject({ ...form, contextual: { type: null, open: true, value: item, position: { x: e.clientX, y: e.clientY } }, selectedTiles: [item] });
            }}
            aria-labelledby="Selectable"
            style={tileStyle}
        >
            <Hex className={css['builder-map-tile-hex']} />
            {form.showIcons && <Icon name={icon} />}
            {form.showDirections && item.display_direction && item.display_direction.output !== '-' ? <Icon name={item.display_direction.output} /> : ''}
            {form.showValues && !form.showIcons && <span>{Boolean(hover) && hover === item.id ? form.interactiveMode.object?.value : item.value}</span>}
            {form.showIds && <span className={css['builder-map-tile-id']}>{item.start ? 'Start' : item.id}</span>}
        </div>
    );
});
