import { useMemo } from 'react';
import css from './ui.module.Css';

function PauseScreen({ context }) {
    const pause = useMemo(() => {
        if (!context || !context?.controls?.toggles) {
            return false;
        }
        return (
            Boolean(context?.controls?.toggles?.pause) &&
            Object.entries({ ...context.controls.toggles })
                .filter((k) => k[0] !== 'interface' && k[0] !== 'pause' && k[0] !== 'minimap')
                .every((k) => k[1] === false)
        );
    }, [context, context?.controls?.toggles]);

    if (!pause) {
        return null;
    }

    return <div className={css['pause-screen']}>Pause</div>;
}

export default PauseScreen;
