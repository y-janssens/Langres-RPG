import { HistoryWrapper } from '../HistoryBuilder';

const Damage = ({ log }) => {
    return <HistoryWrapper log={log}>{log.text}</HistoryWrapper>;
};

export default Damage;
