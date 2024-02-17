import { useMemo } from 'react';
import css from './ui.module.css';

function PauseScreen({ engine, ready }) {
    const pause = useMemo(() => {
        if (!ready) {
            return false;
        }
        return (
            Boolean(engine.controls?.toggles?.pause) &&
            Object.entries({ ...engine.controls.toggles })
                .filter((k) => k[0] !== 'interface' && k[0] !== 'pause' && k[0] !== 'minimap')
                .every((k) => k[1] === false)
        );
    }, [ready, engine, engine.controls?.toggles]);

    if (!pause || !ready) {
        return null;
    }

    return <div className={css['pause-screen']}>Pause</div>;
}

export default PauseScreen;
