import { useEffect, useMemo } from 'react';
import { useSettingsProperties } from '../../hooks';

import css from './ui.module.css';

export const LoadingScreen = ({ form, setForm, engine = {}, loading = false, children = null }) => {
    const { displayLoadingScreen } = useSettingsProperties({ keys: engine.settings.keys.global }, [engine]);

    const progress = useMemo(() => {
        return form.loadingProgress;
    }, [form]);

    useEffect(() => {
        if (displayLoadingScreen && !form.loadingReady) {
            if (progress < 100) {
                const interval = setInterval(() => {
                    setForm('loadingProgress', progress + 2);
                }, 50);

                return () => {
                    clearInterval(interval);
                };
            } else {
                setTimeout(() => {
                    setForm('loadingReady', true);
                }, 1000);
            }
        }
    }, [progress, form, displayLoadingScreen]);

    return (
        <>
            {!form.loadingReady && displayLoadingScreen && <LoadingBar state={progress} />}
            {!loading && children}
        </>
    );
};

function LoadingBar({ state }) {
    return (
        <div className={css['loading-screen-container']}>
            <div className={css['loading-bar-container']}>
                <span className={css['loading-bar-text']}>Loading assets...</span>
                <span className={css['loading-bar-progress']}>{`${state}%`}</span>
                <div className={css['loading-bar-gauge']} style={{ width: `${state}%` }} />
                <div className={css['loading-bar-background']} />
            </div>
        </div>
    );
}
