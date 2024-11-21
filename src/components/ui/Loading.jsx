import css from './ui.module.css';
export const Loading = ({ loading = false, children, height = '100%', text = true, scale = 1 }) => {
    if (loading) {
        return (
            <div className={css['loading-container']} style={{ height: height, transform: `scale(${scale})` }}>
                <div className={css['loading-spinner']}></div>
                <div className={css['loading-background']}></div>
                {text && <span>Loading...</span>}
            </div>
        );
    }
    return children;
};
