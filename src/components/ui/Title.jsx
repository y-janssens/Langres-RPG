import css from './ui.module.css';

function Title({ display }) {
    if (!display) {
        return null;
    }
    return (
        <div className={css['game-title-container']}>
            <div className={css['game-title']}>Langres</div>
            <div className={css['game-subtitle']}>When the kingdom of my youth twirls and falls</div>
        </div>
    );
}

export default Title;
