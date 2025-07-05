import css from './components.module.css';

const HistoryRoll = ({ roll }) => {
    if (!roll) return null;

    return (
        <span className={css['battle-history-roll']}>
            <span className={css[`battle-history-${roll}`]}>{roll.toUpperCase().split('_').join(' ')}</span>
        </span>
    );
};

export default HistoryRoll;
