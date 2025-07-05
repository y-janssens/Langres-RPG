import { HistoryRoll } from '../../components';
import { HistoryWrapper } from '../HistoryBuilder';

const Object = ({ log }) => {
    return (
        <HistoryWrapper log={log}>
            <span>{log.event}</span>
            <span>{log.text}</span>
            <HistoryRoll roll={log.roll} result={log.value} />
        </HistoryWrapper>
    );
};

export default Object;
