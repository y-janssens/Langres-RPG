import { useCallback, useMemo } from 'react';
import { Header, SideBar, Manager, Theme } from './components';
import { useGet, useDynamicForm, useStateHistory } from '../../hooks';
import Map from './Map/Map';
import css from './builder.module.css';
import { Onboarding } from './components/Onboarding/Onboarding';
import { Gateway } from './components/Gateway';
import { Generator } from './components/Generator/Generator';

export const Builder = () => {
    const [form, setForm, setFormObject, resetForm] = useDynamicForm({
        flatDisplay: true,
        selectedMap: null,
        selectedAct: null,
        modalManager: false,
        modalSelect: false,
        modalEditor: false,
        modalGateway: false,
        modalGenerator: false,
        onboarding: { value: false, type: null },
        selectedTiles: [],
        showValues: true,
        showIds: true,
        showObjects: false,
        showIcons: false,
        zoom: 100,
        storyLine: {},
        objects: [],
        functions: []
    });

    const [, loadingStoryline, syncStory] = useGet({
        func: 'fetch_storyline',
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
                    break;
            }
        }
    });

    const [, , syncObjects] = useGet({
        func: 'load_objects',
        useLoader: false,
        onSuccess: (response) => {
            setForm('objects', response);
        }
    });

    const [, , syncFunctions] = useGet({
        func: 'load_functions',
        useLoader: false,
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
        return !form.modalManager && !form.modalEditor && !form.onboarding.value && !form.modalGateway && !form.modalGenerator;
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
                        <Map type={form.flatDisplay} history={history} index={index} display={Boolean(form.selectedMap)} loading={loadingStoryline} form={form} setForm={setForm} />
                    ) : (
                        <>
                            <Onboarding
                                open={form.onboarding.value}
                                type={form.onboarding.type}
                                storyline={form.storyLine}
                                sync={handleSync}
                                onClose={() => setForm('onboarding', { value: false, type: null })}
                            />
                            {/* {form.modalEditor && <Editor open={form.modalEditor} form={form} setForm={setForm} onClose={() => setForm('modalEditor', false)} />} */}
                            {form.modalManager && <Manager open={form.modalManager} storyline={form.storyLine} onClose={() => setForm('modalManager', false)} sync={handleSync} />}
                            {form.modalGenerator && (
                                <Generator open={form.modalGenerator} form={form} setFormObject={setFormObject} onClose={() => setForm('modalGenerator', false)} />
                            )}
                            {form.modalGateway && (
                                <Gateway open={form.modalGateway} form={form} setFormObject={setFormObject} onClose={() => setForm('modalGateway', false)} sync={handleSync} />
                            )}
                        </>
                    ))}
            </div>
        </Theme>
    );
};
