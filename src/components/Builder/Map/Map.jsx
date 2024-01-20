import React, { useCallback, useMemo, useRef, useEffect } from 'react';
import { DragSelectProvider, useDragSelect } from './DragSelectContext';
import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import World from '../../../models/world';
import Icon from '../../ui/Icon';
import { Tiles } from './Tiles';
import { Loading } from '../../ui/Loading';
import css from '../builder.module.css';
import { Hex } from '../../ui/Icons';
const Map = ({ loading, type, display, form, setForm, history, index }) => {
    const world = useMemo(() => {
        if (!form.selectedMap || !history.length) {
            return [];
        }
        let map = form.selectedMap;
        map.content = history[index];
        return new World(map);
    }, [form, history, index]);

    const handleSelect = useCallback(
        (item) => {
            let selected = form.selectedTiles;

            if (!form.selectedTiles.length || !form.selectedTiles.find((it) => it.id === item.id)) {
                selected.push(item);
            } else if (form.selectedTiles.length && Boolean(form.selectedTiles.find((it) => it.id === item.id))) {
                const index = selected.findIndex((it) => it.id === item.id);
                selected.splice(index, 1);
            }
            setForm('selectedTiles', selected);
        },
        [form]
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
                                gridTemplateRows: `repeat(${world.size}, ${55 * (form.zoom / 100)}px)`,
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
                        <BuilderSettings>
                            <group position={[form.selectedMap.size / 2, 0, form.selectedMap.size / 2]}>
                                <Tiles form={form} data={world?.content} handleSelect={handleSelect} />
                            </group>
                        </BuilderSettings>
                    </Canvas>
                )}
            </Loading>
        </div>
    );
};

export default Map;

const MapGrid = ({ form, setForm, data, handleSelect }) => {
    const ds = useDragSelect();

    const isStartingPoint = useCallback((item, startingPoint) => {
        return item.x === startingPoint.x && item.y === startingPoint.y;
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
        return <Maptile key={index} ds={ds} item={item} form={form} handleSelect={handleSelect} />;
    });
};

const Maptile = ({ form, ds, item, handleSelect }) => {
    const tileRef = useRef();

    const active = useMemo(() => {
        if (!form.selectedTiles.length) {
            return false;
        }
        return form.selectedTiles.find((tile) => tile.id === item.id);
    }, [item, form]);

    const icon = useMemo(() => {
        const name = form.objects.find((it) => it.value === item.value).name;
        if (name === 'clear') {
            return null;
        }
        return name;
    }, [form, item, item.value]);

    const colors = useMemo(() => {
        if (!item.start && !item.threshold) {
            return 'unset';
        }
        return `hue-rotate(${item.start ? '-25deg' : '25deg'}) brightness(1.25) saturate(1.5)`;
    }, [item]);

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
            aria-labelledby="Selectable"
            style={{
                filter: colors,
                marginLeft: item.y % 2 !== 0 && `${30 * (form.zoom / 100) + 1}px`,
                height: `${70 * (form.zoom / 100)}px`,
                width: `${((70 * Math.sqrt(3)) / 2) * (form.zoom / 100)}px`
            }}
        >
            <Hex className={css['builder-map-tile-hex']} />
            {form.showIcons && <Icon name={icon} />}
            {form.showValues && !form.showIcons && <span>{item.value}</span>}
            {form.showIds && <span className={css['builder-map-tile-id']}>{item.start ? 'Start' : item.id}</span>}
        </div>
    );
};

function BuilderSettings({ children }) {
    return (
        <>
            <ambientLight intensity={5} />
            <MapControls makeDefault />
            {children}
        </>
    );
}
