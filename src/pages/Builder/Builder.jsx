import { useCallback, useMemo } from 'react';
import { Header, SideBar, Manager, Theme, Collections } from './components';
import { useDynamicForm, useStateHistory } from '../../hooks';
import { Storyline, MapObject, MapFunction } from '../../models';

import Map from './Map/Map';
import { Onboarding } from './components/Onboarding/Onboarding';
import { Gateway } from './components/Gateway';
import { Generator } from './components/Generator/Generator';

import css from './builder.module.css';

export const Builder = () => {
    const [form, setForm, setFormObject, resetForm] = useDynamicForm({
        flatDisplay: true,
        selectedMap: null,
        selectedAct: null,
        modalManager: false,
        modalSelect: false,
        modalDisplay: false,
        modalEditor: false,
        modalGateway: false,
        modalGenerator: false,
        modalCollection: false,
        onboarding: { value: false, type: null },
        selectedTiles: [],
        showValues: false,
        showIds: true,
        showObjects: false,
        showIcons: true,
        showConstraints: false,
        interactiveMode: {
            toggle: false,
            object: null,
            neighours: []
        },
        zoom: 80,
        storyLine: {},
        objects: [],
        functions: []
    });

    const [, loadingStoryline, syncStory] = Storyline.useCommand({
        id: 1,
        useLoader: true,
        onSuccess: (response) => {
            setForm('storyLine', response);
            switch (true) {
                case !response.story.acts.length:
                    setForm('onboarding', { value: true, type: 'acts' });
                    break;
                case response.story.acts.length && response.story.acts.every((act) => !act.content.maps.length):
                    setForm('onboarding', { value: true, type: 'maps' });
                    break;
                default:
                    // Select default values to avoid empty builder
                    if (!form.selectedAct && !form.selectedMap) {
                        setFormObject({ ...form, storyLine: response, selectedAct: response.story.acts[0], selectedMap: response.story.acts[0].content.maps[0] });
                    } else {
                        const act = response.story.acts.find((act) => act.id === form.selectedAct.id);
                        const map = act.content.maps.find((mp) => mp.name === form.selectedMap.name);
                        // Test feature
                        // map.npcs[0].starting_point = {x: 9, y: 6, id: 304}
                        setFormObject({ ...form, storyLine: response, selectedAct: act, selectedMap: map });
                    }
                    break;
            }
        }
    });

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

    const display = useMemo(() => {
        if (!form.storyLine) {
            return false;
        }
        return !form.modalManager && !form.modalEditor && !form.onboarding.value && !form.modalGateway && !form.modalGenerator && !form.modalCollection;
    }, [form]);

    const handleReset = useCallback(() => {
        resetForm();
        clearHistory();
    }, [resetForm, clearHistory]);

    const handleSync = useCallback(() => {
        syncStory();
        syncObjects();
        syncFunctions();
    }, [syncStory, syncObjects, syncFunctions]);

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
                {form.storyLine &&
                    !loadingStoryline &&
                    (display ? (
                        <Map
                            type={form.flatDisplay}
                            history={history}
                            index={index}
                            display={Boolean(form.selectedMap)}
                            loading={loadingStoryline}
                            form={form}
                            setForm={setForm}
                            sync={handleSync}
                        />
                    ) : (
                        <>
                            <Onboarding
                                open={form.onboarding.value}
                                type={form.onboarding.type}
                                storyline={form.storyLine}
                                sync={handleSync}
                                onClose={() => setForm('onboarding', { value: false, type: null })}
                            />
                            {form.modalManager && <Manager open={form.modalManager} storyline={form.storyLine} onClose={() => setForm('modalManager', false)} sync={handleSync} />}
                            {form.modalGenerator && (
                                <Generator open={form.modalGenerator} form={form} setFormObject={setFormObject} onClose={() => setForm('modalGenerator', false)} />
                            )}
                            {form.modalCollection && (
                                <Collections open={form.modalCollection} form={form} setFormObject={setFormObject} onClose={() => setForm('modalCollection', false)} />
                            )}
                            {form.modalGateway && <Gateway open={form.modalGateway} form={form} onClose={() => setForm('modalGateway', false)} sync={handleSync} />}
                        </>
                    ))}
            </div>
        </Theme>
    );
};
