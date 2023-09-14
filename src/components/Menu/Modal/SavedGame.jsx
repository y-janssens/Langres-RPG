import { useCallback, useMemo } from 'react';

import { GameModel } from '../../../models';

import { Close } from '../../ui/Close';

import css from './modal.module.css';

export const SavedGame = ({ item, selected = null, setSelected = () => {}, onLoad = () => {} }) => {
    const lastSavedDate = useMemo(() => {
        const date = item.last_save_date.split('.');
        return date[0];
    }, [item]);

    const active = useMemo(() => {
        return selected === item.id;
    }, [selected, item]);

    const handleDelete = useCallback(() => {
        const game = new GameModel(item);
        game.delete().then(() => {
            onLoad();
        });
    }, [item]);

    return (
        <div
            className={css['saved-game-block']}
            style={{
                filter: active ? 'grayscale(0)' : 'grayscale(0.75)'
            }}
        >
            <div
                className={css['saved-game-item']}
                onClick={() => {
                    setSelected(selected === item.id ? null : item.id);
                }}
            >
                <p>{item.player}</p>
                <p>{`Last save date: ${lastSavedDate}`}</p>
            </div>
            <Close onClick={handleDelete} />
        </div>
    );
};
