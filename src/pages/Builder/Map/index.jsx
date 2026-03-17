import React, { Suspense, useCallback, useMemo } from 'react';
import { invoke } from '@tauri-apps/api/core';

import { World } from '../../../models';
import { useMousePressed } from '../../../hooks';

import { Loading } from '../../../components';

const FlatMap = React.lazy(() => import('./2D/FlatMap'));
const DrawMap = React.lazy(() => import('./2D/DrawMap'));
const Scene = React.lazy(() => import('./3D'));

import css from '../builder.module.css';

export default function Map({ loading, form, setForm, setFormObject, history, index, sync }) {
    const [dragging, startCounter, stopCounter] = useMousePressed();

    const world = useMemo(() => {
        if (!form.selectedMap || !history.length) {
            return [];
        }
        let map = form.selectedMap;
        map.content = history[index];
        return new World(map);
    }, [form.selectedMap, history, index]);

    const Component = useMemo(() => {
        if (form.flatDisplay) {
            return form.drawingMode.toggle ? DrawMap : FlatMap;
        }
        return Scene;
    }, [form.flatDisplay, form.drawingMode.toggle]);

    const handleRegister = useCallback(
        async (item) => {
            if (!form.interactiveMode.toggle) return;
            if (!form.interactiveMode.isValid) return;

            const act = form.storyLine.acts.find((act) => act.id === form.selectedAct.id);
            const map = act.maps.find((mp) => mp.name === form.selectedMap.name);
            await invoke('register_object', {
                actId: act.id,
                mapId: map.id,
                tileId: item.id,
                objectId: form.interactiveMode.object.id,
                enable: true
            }).then(() => sync());
        },
        [form, sync]
    );

    const handleSelect = useCallback(
        async (item) => {
            if (!form.flatDisplay && dragging) return;
            if (form.contextual.open || form.drawingMode.toggle) return;
            if (!form.interactiveMode.toggle) {
                return setForm('selectedTiles', (prev) => {
                    if (prev.find((it) => it.id === item.id)) {
                        return prev.filter((it) => it.id !== item.id);
                    }
                    return [...prev, item];
                });
            }

            return handleRegister(item);
        },
        [form.interactiveMode, form.drawingMode, form.contextual.open, dragging, handleRegister]
    );

    return (
        <div className={css[`builder-body`]} onMouseDown={startCounter} onMouseUp={stopCounter} onMouseLeave={stopCounter}>
            <Loading loading={loading}>
                <Suspense>
                    <Component form={form} setForm={setForm} setFormObject={setFormObject} world={world} handleSelect={handleSelect} />
                </Suspense>
            </Loading>
        </div>
    );
}
