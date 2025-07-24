import { HistoryWrapper } from '../HistoryBuilder';

const Heal = ({ log }) => {
    return <HistoryWrapper log={log}>{log.text}</HistoryWrapper>;
};

export default Heal;
