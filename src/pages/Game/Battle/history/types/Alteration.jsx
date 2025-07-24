import { HistoryWrapper } from '../HistoryBuilder';

const Alteration = ({ log }) => {
    return (
        <HistoryWrapper log={log}>
            <span>{log.text}</span>
        </HistoryWrapper>
    );
};

export default Alteration;
