import React, { useCallback, useMemo } from 'react';
import { invoke } from '@tauri-apps/api/core';

import { World } from '../../../models';

import { Loading } from '../../../components';
import { FlatMap, DrawMap } from './2D';
import { Scene } from './3D';

import css from '../builder.module.css';

export default function Map({ loading, form, setForm, setFormObject, history, index, sync }) {
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
        [form.interactiveMode, form.drawingMode, form.contextual.open, handleRegister]
    );

    return (
        <div className={css[`builder-body`]}>
            <Loading loading={loading}>
                <Component form={form} setForm={setForm} setFormObject={setFormObject} world={world} handleSelect={handleSelect} />
            </Loading>
        </div>
    );
}
