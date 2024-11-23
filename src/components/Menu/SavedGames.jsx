import React, { useState, useMemo, useCallback } from 'react';
import { useGameContext, useTranslation } from '../../hooks';

import { GameModel } from '../../models';

import Modal from '../ui/Modal';
import Icon from '../ui/Icon';
import DeletionModal from '../ui/DeletionModal';

import css from './menu.module.css';

export default function SavedGames({ onClose = () => {} }) {
    const { t } = useTranslation();
    const [engine, setEngine] = useGameContext();
    const [selectedItem, setSelectedItem] = useState(null);
    const [gameToDelete, setGameToDelete] = useState(null);

    const [savedGames, loadingSavedGames, sync] = GameModel.useCommand();

    const items = useMemo(() => {
        if (!savedGames || loadingSavedGames) {
            return [];
        }
        return savedGames.filter((gm) => gm.visible);
    }, [savedGames, loadingSavedGames]);

    const handleLoad = useCallback(() => {
        if (selectedItem) {
            setEngine({ gameId: selectedItem });
            onClose();
        }
    }, [selectedItem, onclose]);

    return (
        <Modal name={t('common.actions.start')} disabled={!selectedItem} onClick={handleLoad}>
            <DeletionModal games={items} gameToDelete={gameToDelete} syncSettings={engine.settings.init()} onLoad={sync} onClose={() => setGameToDelete(null)} onClear={onClose} />
            {items?.map((save) => {
                return <SavedGame selected={selectedItem} setSelected={setSelectedItem} key={save.id} item={save} setGameToDelete={setGameToDelete} />;
            })}
        </Modal>
    );
}

export const SavedGame = ({ item, selected = null, setSelected = () => {}, setGameToDelete = () => {} }) => {
    const { t } = useTranslation();
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
                <p>{`${t('menu.game.save-date')}${lastSavedDate}`}</p>
            </div>
            <Icon name="delete" size="large" color="darkred" onClick={() => setGameToDelete(item)} />
        </div>
    );
};
