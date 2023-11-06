import { Gauge, XpGauge } from '../../../ui/Gauge';
import css from './char-infos.module.css';

export const CharInfos = ({ character }) => {
    return (
        <div className={css['character-infos-container']}>
            <div className={css['character-infos-border']} onClick={() => window.location.reload()} />
            <div className={css['character-infos-level']}>{character.lvl}</div>
            <div className={css['character-infos-bubble']} />
            <div className={css['character-infos-header']}>
                <Gauge stat={character._pv} max={character._pv} type={'pv'} />
                <XpGauge stat={character.xp} max={character.max_xp} />
            </div>
        </div>
    );
};
