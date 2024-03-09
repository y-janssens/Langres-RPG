import React, { useState, useMemo, useCallback } from 'react';
import { useGameContext, useTranslation } from '../../hooks';
import Modal from '../ui/Modal';
import Icon from '../ui/Icon';
import css from './menu.module.css';
import DeletionModal from '../ui/DeletionModal';

export default function SavedGames({ loading = false, items = [], state = null, onClose = () => {}, sync = () => {} }) {
    const { t } = useTranslation();
    const [, setEngine] = useGameContext();
    const [selectedItem, setSelectedItem] = useState(null);
    const [gameToDelete, setGameToDelete] = useState(null);

    const handleLoad = useCallback(() => {
        if (selectedItem) {
            setEngine({ gameId: selectedItem });
            onClose();
        }
    }, [selectedItem, onclose]);

    if (!state || state !== 'saved_games') {
        return null;
    }

    return (
        <Modal name={t('common.actions.start')} loading={loading} disabled={!selectedItem} onClick={handleLoad}>
            <DeletionModal games={items} gameToDelete={gameToDelete} onLoad={sync} onClose={() => setGameToDelete(null)} onClear={onClose} />
            {items?.map((save) => {
                return <SavedGame selected={selectedItem} setSelected={setSelectedItem} key={save.id} item={save} setGameToDelete={setGameToDelete} />;
            })}
        </Modal>
    );
}

export const SavedGame = ({ item, selected = null, setSelected = () => {}, setGameToDelete = () => {} }) => {
    const lastSavedDate = useMemo(() => {
        const date = item.last_save_date.split('.');
        return date[0];
    }, [item]);

    const active = useMemo(() => {
        return selected === item.id;
    }, [selected, item]);

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
            <Icon name="delete" size="large" color="darkred" onClick={() => setGameToDelete(item)} />
        </div>
    );
};
