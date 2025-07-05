import { HistoryWrapper } from '../HistoryBuilder';
import { HistoryRoll } from '../../components';

const Action = ({ log }) => {
    return (
        <HistoryWrapper log={log}>
            <span>{`${log.event}: ${log.value}`}</span>
            <span>{log.text}</span>
            <HistoryRoll roll={log.roll} />
        </HistoryWrapper>
    );
};

export default Action;
