import { useEffect, useRef } from 'react';

import HistoryLog from '../history/HistoryBuilder';

import css from './components.module.css';

const BattleHistory = ({ history }) => {
    const containerRef = useRef(null);

    useEffect(() => {
        if (containerRef.current) {
            containerRef.current.scrollTo({
                top: containerRef.current.scrollHeight,
                behavior: 'smooth'
            });
        }
    }, [history]);

    return (
        <div className={css['battle-history-container']} ref={containerRef}>
            {history.map((log, index) => (
                <HistoryLog key={index} log={log} />
            ))}
        </div>
    );
};

export default BattleHistory;
