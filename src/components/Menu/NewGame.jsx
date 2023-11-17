import React, { useState, useCallback } from 'react';
import { invoke } from '@tauri-apps/api/tauri';
import { GameModel } from '../../models';
import { useGameContext } from '../../hooks';
import { useTranslation } from 'react-i18next';
import Modal from '../ui/Modal';
import css from './menu.module.css';

export default function NewGame({ loading = false, state = null, sync = () => {}, onClose = () => {} }) {
    const { t } = useTranslation();
    const [, setContext] = useGameContext();
    const [playerName, setPlayerName] = useState('');

    const handleNewGame = useCallback(
        async (name) => {
            await invoke('new', { name })
                .then((data) => {
                    let game = new GameModel(data);
                    setContext({ gameId: game.id, builder: false });
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
