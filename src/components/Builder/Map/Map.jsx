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
        return new World(map).parse();
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

    return (
        <div id="map-grid" className={css[!form.mode || !world.length ? `builder-body` : `builder-body-3d`]}>
            <Loading loading={loading}>
                {display && Boolean(type) ? (
                    <DragSelectProvider settings={{ draggability: false, area: document.querySelector('#builder-body-block') }}>
                        {world.map((row, i) => {
                            return (
                                <div key={i}>
                                    {row.map((item, index) => {
                                        return <Maptile key={index} item={item} form={form} setForm={setForm} handleSelect={handleSelect} state={state} />;
                                    })}
                                </div>
                            );
                        })}
                    </DragSelectProvider>
                ) : (
                    <Canvas
                        shadows
                        camera={{
                            position: [0, 15, -18.86],
                            fov: 25,
                            zoom: 1.25
                        }}
                    >
                        <BuilderSettings>
                            <group position={[-form.selectedMap.size / 2, 0, -form.selectedMap.size / 2]}>
                                <Tiles form={form} data={world} handleSelect={handleSelect} />
                            </group>
                        </BuilderSettings>
                    </Canvas>
                )}
            </Loading>
        </div>
    );
};

export default Map;

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
        <div className={css[active ? 'builder-map-tile-active' : 'builder-map-tile']} ref={tileRef} onClick={() => handleSelect(item)} aria-labelledby="Selectable">
            {form.showIcons && <Icon name={icon} />}
            {form.showValues && !form.showIcons && <span>{item.value}</span>}
            {form.showIds && <span className={css['builder-map-tile-id']}>{item.id}</span>}
        </div>
    );
};

function BuilderSettings({ children }) {
    return (
        <>
            <ambientLight intensity={5} />
            {/* <pointLight intensity={2500} position={[0, 10, 0]} decay={2.25} distance={12} /> */}
            <MapControls makeDefault />
            {children}
        </>
    );
}
