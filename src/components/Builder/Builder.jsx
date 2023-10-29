import { useCallback, useMemo, useState } from 'react';
import { Header, Menu, SettingsModal } from './ui';
import { Theme } from 'react-daisyui';
import { useGet, useForm } from '../../hooks';
import BuilderState from './state';
import Map from './Map/Map';

import css from './builder.module.css';

export const Builder = () => {
    const [state] = useState(() => new BuilderState());
    const [form, setForm, setFormObject] = useForm(state?.defaultForm);

    const [storyLine, loadingStoryline, syncStory] = useGet({
        func: 'load_storyline'
    });

    const resetForm = useCallback(() => {
        setFormObject(state.defaultForm);
    }, [state]);

    const hasselectedMap = useMemo(() => {
        return form.selectedMap !== 'default';
    }, [form]);

    return (
        <>
            <Theme dataTheme="night" className={css['builder-main-container']}>
                <SettingsModal open={form.modalNew} storyline={storyLine} onClose={() => setForm('modalNew', false)} sync={syncStory} reset={resetForm} />
                <Header form={form} datas={storyLine} setForm={setForm} sync={syncStory} reset={resetForm} />
                <Menu form={form} setForm={setForm} state={state} storyline={storyLine} sync={syncStory} />
                <div id="builder-body-block" className={css['builder-body-container']}>
                    <Map type={form.mode} display={hasselectedMap} loading={loadingStoryline} form={form} state={state} setForm={setForm} />
                </div>
            </Theme>
        </>
    );
};
