import { useCallback, useMemo, useState } from 'react';
import { Header, Menu, Manager } from './ui';
import { Theme } from 'react-daisyui';
import { useGet, useForm } from '../../hooks';
import { useGameContext } from '../../hooks';
import BuilderState from './state';
import Map from './Map/Map';

import css from './builder.module.css';

export const Builder = () => {
    const [, setContext] = useGameContext();
    const [state] = useState(() => new BuilderState());
    const [form, setForm, setFormObject] = useForm(state?.defaultForm);

    const [storyLine, loadingStoryline, syncStory] = useGet({
        func: 'fetch_storyline'
    });

    // const [objects] = useGet({
    //     func: 'load_objects'
    // });

    const resetForm = useCallback(() => {
        setFormObject(state.defaultForm);
    }, [state]);

    const hasselectedMap = useMemo(() => {
        return form.selectedMap !== 'default';
    }, [form]);

    return (
        <>
            <Theme dataTheme="night" className={css['builder-main-container']}>
                <Header form={form} datas={storyLine} setForm={setForm} sync={syncStory} reset={resetForm} setContext={setContext} />
                <Menu form={form} setForm={setForm} state={state} storyline={storyLine} sync={syncStory} objects={[]} />
                <div id="builder-body-block" className={css['builder-body-container']}>
                    {storyLine &&
                        !loadingStoryline &&
                        (!form.modalNew ? (
                            <Map type={form.mode} display={hasselectedMap} loading={loadingStoryline} form={form} state={state} setForm={setForm} />
                        ) : (
                            <Manager open={form.modalNew} storyline={storyLine} onClose={() => setForm('modalNew', false)} sync={syncStory} />
                        ))}
                </div>
            </Theme>
        </>
    );
};
