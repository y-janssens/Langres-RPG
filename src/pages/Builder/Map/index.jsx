import React, { useCallback, useMemo } from 'react';
import { invoke } from '@tauri-apps/api/core';

import { World } from '../../../models';

import { Loading } from '../../../components';
import { FlatMap } from './flat/FlatMap';
import { Scene } from './3D/Scene';

import css from '../builder.module.css';

export default function Map({ loading, flatDisplay, form, setForm, history, index, sync }) {
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

    return (
        <div className={css[`builder-body`]}>
            <Loading loading={loading}>
                {flatDisplay ? (
                    <FlatMap form={form} setForm={setForm} world={world} handleSelect={handleSelect} />
                ) : (
                    <Scene form={form} world={world} handleSelect={handleSelect} />
                )}
            </Loading>
        </div>
    );
}
