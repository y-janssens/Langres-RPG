import { useCallback, useMemo } from 'react';
import { Header, Menu, Manager, Theme } from './ui';
import { useGet, useDynamicForm, useGameContext, useStateHistory } from '../../hooks';
import Map from './Map/Map';
import css from './builder.module.css';

export const Builder = () => {
    const [, setContext] = useGameContext();

    const [form, setForm, setFormObject, resetForm] = useDynamicForm({
        flatDisplay: true,
        selectedMap: null,
        selectedAct: null,
        modalManager: false,
        modalSelect: false,
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
            setForm('storyLine', { ...response });
        }
    });

    const [, , syncObjects] = useGet({
        func: 'load_objects',
        onSuccess: (response) => {
            setForm('objects', response);
        }
    });

    const [, , syncFunctions] = useGet({
        func: 'load_functions',
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
                setContext={setContext}
                setObject={setFormObject}
            />
            <Menu form={form} setForm={setForm} storyline={form.storyLine} />
            <div id="builder-body-block" className={css['builder-body-container']}>
                {form.storyLine &&
                    !loadingStoryline &&
                    (!form.modalManager ? (
                        <Map type={form.flatDisplay} history={history} index={index} display={Boolean(form.selectedMap)} loading={loadingStoryline} form={form} setForm={setForm} />
                    ) : (
                        <Manager open={form.modalManager} storyline={form.storyLine} onClose={() => setForm('modalManager', false)} sync={handleSync} />
                    ))}
            </div>
        </Theme>
    );
};
