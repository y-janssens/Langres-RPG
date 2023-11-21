import React, { useCallback, useMemo, useRef, useEffect } from 'react';
import { DragSelectProvider, useDragSelect } from './DragSelectContext';
import { Canvas } from '@react-three/fiber';
import { MapControls } from '@react-three/drei';
import World from '../../../models/world';
import Icon from '../../ui/Icon';
import { Tiles } from './Tiles';
import { Loading } from '../../ui/Loading';
import css from '../builder.module.css';

const Map = ({ loading, type, display, form, setForm, state, history, index }) => {
    const world = useMemo(() => {
        if (form.selectedMap === 'default' || !history.length) {
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
                setForm('selectedTiles', selected);
            } else if (form.selectedTiles.length && Boolean(form.selectedTiles.find((it) => it.id === item.id))) {
                const index = selected.findIndex((it) => it.id === item.id);
                selected.splice(index, 1);
                setForm('selectedTiles', selected);
            }
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
                                gridTemplateRows: `repeat(${world.size}, ${world.size + 5}px)`,
                                gridTemplateColumns: `repeat(${world.size}, ${world.size + 5}px)`
                            }}
                        >
                            <MapGrid form={form} setForm={setForm} data={world} state={state} handleSelect={handleSelect} />
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
                                <Tiles form={form} data={world?.parse() || []} handleSelect={handleSelect} />
                            </group>
                        </BuilderSettings>
                    </Canvas>
                )}
            </Loading>
        </div>
    );
};

export default Map;

const MapGrid = ({ form, setForm, data, handleSelect, state }) => {
    const items = useMemo(() => {
        return data.content?.map((it) => {
            if (it.x === data.starting_point.x && it.y === data.starting_point.y) {
                it['start'] = true;
            } else {
                delete it['start'];
            }
            return it;
        });
    }, [data, data.starting_point]);

    return items.map((item, index) => {
        return <Maptile key={index} item={item} form={form} setForm={setForm} handleSelect={handleSelect} state={state} />;
    });
};

const Maptile = ({ form, setForm, item, handleSelect, state }) => {
    const ds = useDragSelect();
    const tileRef = useRef();

    const active = useMemo(() => {
        if (!form.selectedTiles || !form.selectedTiles.length) {
            return false;
        }
        return form.selectedTiles.find((tile) => tile.id === item.id);
    }, [item, form]);

    const icon = useMemo(() => {
        const name = state?.items.find((it) => it.value === item.value).icon;
        if (name === 'clear') {
            return null;
        }
        return name;
    }, [state, item, item.value]);

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
            style={{ filter: item.start ? 'hue-rotate(-25deg) brightness(1.25) saturate(1.5)' : 'unset' }}
        >
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
