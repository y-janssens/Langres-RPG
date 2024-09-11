import React, { useCallback, useMemo, useRef, useEffect, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { DragSelectProvider, useDragSelect } from './DragSelectContext';
import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import World from '../../../models/world';
import Icon from '../../../components/ui/Icon';
import { Tiles } from './Tiles';
import { Loading } from '../../../components/ui/Loading';
import { Hex } from '../../../components/ui/Icons';
import css from '../builder.module.css';

export default function Map({ loading, type, display, form, setForm, history, index, sync }) {
    const world = useMemo(() => {
        if (!form.selectedMap || !history.length) {
            return [];
        }
        let map = form.selectedMap;
        map.content = history[index];
        return new World(map);
    }, [form, history, index]);

    const handleRegister = useCallback(
        async (item) => {
            const act = form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id);
            const map = act.content.maps.find((mp) => mp.name === form.selectedMap.name);
            await invoke('register_object', {
                actId: act.id,
                mapId: map.id,
                tileId: item.id,
                objectId: form.interactiveMode.object.id,
                enable: true
            }).then(() => {
                sync();
                setForm('interactiveMode', {
                    toggle: form.interactiveMode.toggle,
                    object: form.interactiveMode.object,
                    neighours: []
                });
            });
        },
        [form, sync]
    );

    const handleSelect = useCallback(
        async (item) => {
            if (!form.interactiveMode.toggle) {
                let selected = form.selectedTiles;

                if (!form.selectedTiles.length || !form.selectedTiles.find((it) => it.id === item.id)) {
                    selected.push(item);
                } else if (form.selectedTiles.length && Boolean(form.selectedTiles.find((it) => it.id === item.id))) {
                    const index = selected.findIndex((it) => it.id === item.id);
                    selected.splice(index, 1);
                }
                return setForm('selectedTiles', selected);
            }
            return handleRegister(item);
        },
        [form, sync, handleRegister]
    );

    if (!world.content?.length) {
        return null;
    }

    return (
        <div className={css[`builder-body`]}>
            <Loading loading={loading}>
                {display && Boolean(type) ? (
                    <DragSelectProvider settings={{ draggability: false, area: document.querySelector('#builder-body-block') }}>
                        <div
                            className={css['builder-map-grid']}
                            style={{
                                columnGap: `${Math.ceil(Math.sqrt(55 * (form.zoom / 100)))}px`,
                                gridTemplateRows: `repeat(${world.size + Math.ceil(Math.sqrt(world.size))}, ${55 * (form.zoom / 100)}px)`,
                                gridTemplateColumns: `repeat(${world.size}, ${55 * (form.zoom / 100)}px)`
                            }}
                        >
                            <MapGrid form={form} setForm={setForm} data={world} handleSelect={handleSelect} />
                        </div>
                    </DragSelectProvider>
                ) : (
                    <Canvas
                        shadows
                        camera={{
                            position: [0, 15, -18.86],
                            fov: 25,
                            zoom: 0.5
                        }}
                    >
                        <>
                            <ambientLight intensity={5} />
                            <MapControls makeDefault />
                            <group position={[form.selectedMap.size / 2, 0, form.selectedMap.size / 2]}>
                                <Tiles form={form} data={world?.content} handleSelect={handleSelect} />
                            </group>
                        </>
                    </Canvas>
                )}
            </Loading>
        </div>
    );
}

const MapGrid = ({ form, setForm, data, handleSelect }) => {
    const [hover, setHover] = useState(null);
    const ds = useDragSelect();

    const isStartingPoint = useCallback((item, startingPoint) => {
        return item.x / 1.5 === startingPoint.x && item.y + 2 === startingPoint.y;
    }, []);

    const mapItems = useMemo(() => {
        return data.content?.map((item) => ({
            ...item,
            start: isStartingPoint(item, data.starting_point)
        }));
    }, [data.content, data.starting_point]);

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

    return mapItems.map((item, index) => {
        return <Maptile key={index} ds={ds} item={item} form={form} setForm={setForm} hover={hover} setHover={setHover} handleSelect={handleSelect} />;
    });
};

const Maptile = ({ form, setForm, hover, setHover, ds, item, handleSelect }) => {
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
