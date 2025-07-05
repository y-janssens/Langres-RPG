import { HistoryWrapper } from '../HistoryBuilder';

const Stand = ({ log }) => {
    return <HistoryWrapper log={log}>{log.text}</HistoryWrapper>;
};

export default Stand;
