import React, { useState, useCallback } from 'react';
import { invoke } from '@tauri-apps/api';
import { useGameContext, useTranslation } from '../../hooks';

import { GameModel } from '../../models';

import Modal from '../ui/Modal';

import css from './menu.module.css';

export default function NewGame({ onClose = () => {} }) {
    const { t } = useTranslation();
    const [, setEngine] = useGameContext();
    const [playerName, setPlayerName] = useState('');

    const handleNewGame = useCallback(async () => {
        await invoke('new_game', { playerName })
            .then((data) => {
                let game = new GameModel(data);
                game.save();
                setEngine({ gameId: game.id });
            })
            .finally(() => {
                onClose();
            });
    }, [playerName, onClose]);

    const handleSave = useCallback(
        (event) => {
            if (event.key !== 'Enter') return;
            handleNewGame();
        },
        [handleNewGame]
    );

    return (
        <Modal height="250px" name={t('common.actions.start')} onClick={() => handleNewGame()} disabled={!playerName.length}>
            <div className={css['new-game-input']} onKeyDown={handleSave}>
                <input type="text" placeholder={t('menu.game.new')} value={playerName} onChange={({ target: { value } }) => setPlayerName(value)} />
            </div>
        </Modal>
    );
}
