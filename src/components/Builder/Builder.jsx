import { useCallback, useMemo, useState } from 'react';
import { Header, Menu, Manager } from './ui';
import { Theme } from 'react-daisyui';
import { useGet, useForm, useGameContext, useStateHistory } from '../../hooks';
import BuilderState from './state';
import Map from './Map/Map';

import css from './builder.module.css';

export const Builder = () => {
    const [, setContext] = useGameContext();
    const [state] = useState(() => new BuilderState());
    const [form, setForm, setFormObject] = useForm(state?.defaultForm);

    const [, loadingStoryline, syncStory] = useGet({
        func: 'fetch_storyline',
        onSuccess: (response) => {
            setForm('storyLine', { ...response });
        }
    });

    const currentMap = useMemo(() => {
        if (form.selectedMap === 'default' || !form.selectedAct) {
            return null;
        }
        return form.selectedMap.content;
    }, [form, form.selectedMap]);

    const [history, index, forward, backward, clearHistory] = useStateHistory({
        init: form.selectedMap !== 'default',
        listener: currentMap
    });

    const resetForm = useCallback(() => {
        setFormObject(state.defaultForm);
        clearHistory();
    }, [state, clearHistory]);

    const hasselectedMap = useMemo(() => {
        return form.selectedMap !== 'default';
    }, [form]);

    return (
        <>
            <Theme dataTheme="night" className={css['builder-main-container']}>
                <Header
                    form={form}
                    datas={form.storyLine}
                    setForm={setForm}
                    sync={syncStory}
                    reset={resetForm}
                    setContext={setContext}
                    history={history}
                    index={index}
                    forward={forward}
                    backward={backward}
                    clear={clearHistory}
                />
                <Menu form={form} setForm={setForm} state={state} storyline={form.storyLine} sync={syncStory} objects={[]} />
                <div id="builder-body-block" className={css['builder-body-container']}>
                    {form.storyLine &&
                        !loadingStoryline &&
                        (!form.modalManager ? (
                            <Map type={form.mode} history={history} index={index} display={hasselectedMap} loading={loadingStoryline} form={form} state={state} setForm={setForm} />
                        ) : (
                            <Manager open={form.modalManager} storyline={form.storyLine} onClose={() => setForm('modalManager', false)} sync={syncStory} />
                        ))}
                </div>
            </Theme>
        </>
    );
};
