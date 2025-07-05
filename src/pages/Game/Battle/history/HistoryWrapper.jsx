import css from '../components/components.module.css';

const HistoryWrapper = ({ children }) => {
    return <div className={css['battle-history-item']}>{children}</div>;
};

export default HistoryWrapper;
