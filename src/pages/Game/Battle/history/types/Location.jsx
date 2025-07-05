import { HistoryWrapper } from '../HistoryBuilder';

const Location = ({ log }) => {
    return (
        <HistoryWrapper log={log}>
            <span>{log.event}</span>
            <span>{log.text}</span>
        </HistoryWrapper>
    );
};

export default Location;
