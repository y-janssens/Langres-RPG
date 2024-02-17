import React, { useState, useCallback } from 'react';
import { invoke } from '@tauri-apps/api';
import { GameModel } from '../../models';
import { useGameContext, useTranslation } from '../../hooks';
import Modal from '../ui/Modal';
import css from './menu.module.css';

export default function NewGame({ loading = false, state = null, sync = () => {}, onClose = () => {} }) {
    const { t } = useTranslation();
    const [, setEngine] = useGameContext();
    const [playerName, setPlayerName] = useState('');

    const handleNewGame = useCallback(
        async (name) => {
            await invoke('new', { name })
                .then((data) => {
                    let game = new GameModel(data);
                    setEngine({ gameId: game.id });
                    game.save();
                    sync();
                })
                .finally(() => {
                    onClose();
                });
        },
        [sync, onClose]
    );

    if (state !== 'new_game') {
        return null;
    }
    return (
        <Modal loading={loading} height="250px" name={t('actions.start')} onClick={() => handleNewGame(playerName)} disabled={!playerName.length}>
            <div className={css['new-game-input']}>
                <input type="text" placeholder="Enter player name" value={playerName} onChange={({ target: { value } }) => setPlayerName(value)} />
            </div>
        </Modal>
    );
}
