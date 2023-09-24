import { useEffect, useState } from 'react';
import css from './ui.module.css';
export const LoadingScreen = ({ context = {}, loading = false, children = null }) => {
    const [progress, setProgress] = useState(0);
    const [ready, setReady] = useState(false);

    useEffect(() => {
        if (progress < 100) {
            const interval = setInterval(() => {
                setProgress((pgr) => pgr + 2);
            }, 100);

            return () => {
                clearInterval(interval);
            };
        } else {
            setTimeout(() => {
                setReady(true);
            }, 1000);
        }
    }, [progress]);

    return (
        <>
            {!ready && !context.devMode && <LoadingBar state={progress} />}
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
