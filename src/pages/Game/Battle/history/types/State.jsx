import { HistoryWrapper } from '../HistoryBuilder';

const State = ({ log }) => {
    return <HistoryWrapper log={log}>{log.event}</HistoryWrapper>;
};

export default State;
