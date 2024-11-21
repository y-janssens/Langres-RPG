import React, { useCallback, useMemo, useRef, useEffect } from 'react';
import { invoke } from '@tauri-apps/api';

import Icon from '../../../../components/ui/Icon';
import { Hex } from '../../../../components/ui/Icons';

import css from '../../builder.module.css';

export const Maptile = ({ form, setForm, hover, setHover, ds, item, handleSelect }) => {
    const tileRef = useRef();

    const active = useMemo(() => {
        if (!form.selectedTiles.length) {
            return false;
        }
        return form.selectedTiles.find((tile) => tile.id === item.id);
    }, [item, form]);

    const icon = useMemo(() => {
        const name = form.objects.find((it) => it.value === item.value)?.name;
        if (name === 'clear') {
            return null;
        }
        return name;
    }, [form, item, item.value]);

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

    const color = useMemo(() => {
        if (!form.showConstraints) {
            switch (item.value) {
                case 'C':
                    return 'rgba(200, 255, 19, .5)';
                case 'T':
                    return 'rgba(94, 219, 53, .8)';
                case 'S':
                    return 'rgb(219, 210, 87)';
                case 'W':
                    return 'lightskyblue';
                case 'R':
                    return '#808080';
                case '-':
                default:
                    return 'darkkhaki';
            }
        }

        if (Boolean(hover) && hover === item.id) {
            return '#019ae6';
        }
        if (form.interactiveMode) {
            if (form.interactiveMode.neighours?.includes(item.id)) {
                return 'rgba(1, 154, 230, .5)';
            }
        }
        return item.walkable ? '#909090' : '#404040';
    }, [form, item, hover]);

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
                        neighours: response
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
        [form, item, hover]
    );

    useEffect(() => {
        const element = tileRef.current;
        if (!element || !ds) return;
        element.tile = item;
        ds.addSelectables(element);
    }, [ds, tileRef]);

    return (
        <div
            className={css[active ? 'builder-map-tile-active' : 'builder-map-tile']}
            ref={tileRef}
            onClick={() => handleSelect(item)}
            onMouseEnter={() => handleHover(true)}
            onMouseLeave={() => handleHover(false)}
            aria-labelledby="Selectable"
            style={{
                filter: filters,
                backgroundColor: color,
                marginLeft: item.y % 2 === 0 && `${30 * (form.zoom / 100) + 1}px`,
                height: `${70 * (form.zoom / 100)}px`,
                width: `${((70 * Math.sqrt(3)) / 2) * (form.zoom / 100)}px`
            }}
        >
            <Hex className={css['builder-map-tile-hex']} />
            {form.showIcons && <Icon name={icon} />}
            {form.showValues && !form.showIcons && <span>{Boolean(hover) && hover === item.id ? form.interactiveMode.object.value : item.value}</span>}
            {form.showIds && <span className={css['builder-map-tile-id']}>{item.start ? 'Start' : item.id}</span>}
        </div>
    );
};
