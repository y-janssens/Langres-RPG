import React, { useCallback, useMemo } from 'react';
import { Header, SideBar, Theme } from './components';
import { useDynamicForm, useStateHistory } from '../../hooks';
import { Storyline, MapObject, MapFunction } from '../../models';

import Map from './Map';
import { BuilderModal } from './Modals';

import css from './builder.module.css';

export const Builder = () => {
    const [form, setForm, setFormObject, resetForm] = useDynamicForm({
        zoom: 80,
        storyLine: {},
        selectedMap: null,
        selectedAct: null,
        showIds: true,
        showIcons: true,
        flatDisplay: true,
        showValues: false,
        showObjects: false,
        displayOptions: false,
        displaySelector: false,
        showConstraints: false,
        objects: [],
        functions: [],
        selectedTiles: [],
        modal: { type: null, open: false, value: null },
        interactiveMode: { toggle: false, object: null, neighours: [] }
    });

    const [, loadingStoryline, syncStory] = Storyline.useCommand(
        {
            useLoader: true,
            onSuccess: (response) => {
                setForm('storyLine', response);
                switch (true) {
                    case !response.story.acts.length:
                        setForm('modal', { type: 'onboarding', open: true, value: 'acts' });
                        break;
                    case response.story.acts.length && response.story.acts.every((act) => !act.content.maps.length):
                        setForm('modal', { type: 'onboarding', open: true, value: 'maps' });
                        break;
                    default:
                        // Select default values to avoid empty builder
                        if (!form.selectedAct && !form.selectedMap) {
                            setFormObject({ ...form, storyLine: response, selectedAct: response.story.acts[0], selectedMap: response.story.acts[0].content.maps[0] });
                        } else {
                            const act = response.story.acts.find((act) => act.id === form.selectedAct.id);
                            const map = act.content.maps.find((mp) => mp.name === form.selectedMap.name);
                            setFormObject({ ...form, storyLine: response, selectedAct: act, selectedMap: map });
                        }
                        break;
                }
            }
        },
        []
    );

    const [, , syncObjects] = MapObject.useCommand({
        onSuccess: (response) => {
            setForm('objects', response);
        }
    });

    const [, , syncFunctions] = MapFunction.useCommand({
        onSuccess: (response) => {
            setForm('functions', response);
        }
    });

    const currentMap = useMemo(() => {
        if (!form.selectedMap) {
            return null;
        }
        return form.selectedMap.content;
    }, [form]);

    const [history, index, forward, backward, clearHistory] = useStateHistory({
        init: Boolean(form.selectedMap),
        listener: currentMap
    });

    const handleReset = useCallback(() => {
        resetForm();
        clearHistory();
    }, [resetForm, clearHistory]);

    const handleSync = useCallback(() => {
        syncStory();
        syncObjects();
        syncFunctions();
    }, [syncStory, syncObjects, syncFunctions]);

    const display = useMemo(() => {
        if (!form.storyLine) {
            return false;
        }
        return !form.modal.type && !form.modal.open;
    }, [form]);

    return (
        <Theme dataTheme="night" className={css['builder-main-container']}>
            <Header
                form={form}
                index={index}
                sync={handleSync}
                forward={forward}
                setForm={setForm}
                history={history}
                reset={handleReset}
                backward={backward}
                clear={clearHistory}
                datas={form.storyLine}
                setObject={setFormObject}
            />
            <SideBar form={form} setForm={setForm} setFormObject={setFormObject} storyline={form.storyLine} />
            <div id="builder-body-block" className={css['builder-body-container']}>
                {display ? (
                    <Map flatDisplay={form.flatDisplay} history={history} index={index} loading={loadingStoryline} form={form} setForm={setForm} sync={handleSync} />
                ) : (
                    <BuilderModal
                        form={form}
                        setForm={setForm}
                        sync={handleSync}
                        datas={form.modal}
                        setFormObject={setFormObject}
                        onClose={() => setForm('modal', { type: null, open: false, value: null })}
                    />
                )}
            </div>
        </Theme>
    );
};
