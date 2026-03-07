import { useCallback, useMemo } from 'react';

import { useDynamicForm, useStateHistory } from '../../hooks';
import { Storyline, MapObject, MapFunction, Brush, DIRECTIONS } from '../../models';

import { Content, Header, Palette, SideBar, Theme } from './components';

import css from './builder.module.css';

export const Builder = () => {
    const [form, setForm, setFormObject, resetForm] = useDynamicForm({
        zoom: 80,
        storyLine: {},
        selectedMap: null,
        selectedAct: null,
        showIds: true,
        showIcons: true,
        showDirections: false,
        flatDisplay: true,
        showValues: false,
        showObjects: false,
        displayOptions: false,
        displayActions: false,
        displaySelector: false,
        showConstraints: false,
        brushes: [],
        objects: [],
        functions: [],
        selectedTiles: [],
        modal: { type: null, open: false, value: null },
        drawingMode: { toggle: false, object: null, size: 50, density: 50, overwrite: false },
        interactiveMode: { toggle: false, object: null, neighours: [], isValid: true },
        contextual: { type: null, open: false, value: null, position: { x: null, y: null } },
        directions: DIRECTIONS.map((dir) => ({ display_direction: dir ? { output: dir, custom: true, values: null } : null }))
    });

    const [, loadingStoryline, syncStory] = Storyline.useCommand(
        {
            useLoader: true,
            onSuccess: (response) => {
                setForm('storyLine', response);
                switch (true) {
                    case !response.acts.length:
                        setForm('modal', { type: 'onboarding', open: true, value: 'acts' });
                        break;
                    case response.acts.length && response.acts.every((act) => !act.maps.length):
                        setForm('modal', { type: 'onboarding', open: true, value: 'maps' });
                        break;
                    default:
                        // Pre-select default values to avoid loading an empty builder
                        if (!form.selectedAct && !form.selectedMap) {
                            setFormObject((prev) => ({
                                ...prev,
                                displayActions: false,
                                storyLine: response,
                                selectedAct: response.acts[0],
                                selectedMap: response.acts[0].maps[0]
                            }));
                        } else {
                            const act = response.acts.find((act) => act.id === form.selectedAct.id);
                            const map = act.maps.find((mp) => mp.name === form.selectedMap.name);
                            setFormObject((prev) => ({
                                ...prev,
                                displayActions: false,
                                storyLine: response,
                                selectedAct: act,
                                selectedMap: map,
                                modal: { type: null, open: false, value: null },
                                contextual: { type: null, open: false, value: null },
                                interactiveMode: { toggle: false, object: null, neighours: [], isValid: true },
                                selectedTiles: []
                            }));
                        }
                        break;
                }
            }
        },
        []
    );

    Brush.useCommand({
        onSuccess: (response) => setForm('brushes', response)
    });

    MapObject.useCommand({
        onSuccess: (response) => setForm('objects', response)
    });

    MapFunction.useCommand({
        onSuccess: (response) => setForm('functions', response)
    });

    const currentMap = useMemo(() => {
        if (!form.selectedMap) {
            return null;
        }
        return form.selectedMap.content;
    }, [form.selectedMap]);

    const [history, index, forward, backward, clearHistory] = useStateHistory({
        init: Boolean(form.selectedMap),
        listener: currentMap
    });

    const handleReset = useCallback(() => {
        resetForm();
        clearHistory();
    }, [resetForm, clearHistory]);

    return (
        <Theme dataTheme="night" className={css['builder-main-container']}>
            <Header
                form={form}
                index={index}
                sync={syncStory}
                forward={forward}
                setForm={setForm}
                history={history}
                reset={handleReset}
                backward={backward}
                clear={clearHistory}
                datas={form.storyLine}
                setFormObject={setFormObject}
            />
            <SideBar form={form} setForm={setForm} setFormObject={setFormObject} storyline={form.storyLine} />
            <Content form={form} setForm={setForm} setFormObject={setFormObject} history={history} sync={syncStory} loadingStoryline={loadingStoryline} index={index} />
            <Palette form={form} setForm={setForm} />
        </Theme>
    );
};
