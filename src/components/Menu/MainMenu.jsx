import { useCallback, useMemo, useState } from 'react';
import useGameContext from '../../hooks/useGameContext';

import { GameModel } from '../../models';
import { useGet } from '../../hooks/useGet';

import { invoke } from '@tauri-apps/api/tauri';
import { exit } from '@tauri-apps/api/process';

import { MenuItem } from './MenuItem';
import { Modal } from './Modal/Modal';

import css from './menu.module.css';

export const MainMenu = () => {
    const [openModal, setOpenModal] = useState(null);
    const [context, setContext] = useGameContext();

    const [savedGames, loadingGames, , sync] = useGet({
        func: 'load_saves'
    });

    const handleNewGame = useCallback(async (name) => {
        await invoke('new', { name }).then((data) => {
            let game = new GameModel(data);
            game.save();
            setContext({ gameId: game.id });
            setOpenModal(null);
        });
    }, []);

    const handleSaveGame = useCallback(() => {
        const data = savedGames?.find((gm) => gm.id === context.gameId);
        let game = new GameModel(data);
        game.save();
    }, [savedGames, context]);

    const exitGame = useCallback(async () => {
        return await exit(1);
    }, []);

    const handleMenu = useCallback(
        (event) => {
            if (openModal) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
                }
            }
        },
        [openModal]
    );

    const lastPlayedGame = useMemo(() => {
        if (loadingGames || !savedGames?.some((gm) => Boolean(gm.last_save_date))) {
            return null;
        }
        let games = savedGames?.map((gm) => ({
            id: gm.id,
            date: new Date(gm.last_save_date.split('.')[0])
        }));
        return games.sort((a, b) => a.date < b.date)[0];
    }, [savedGames, loadingGames]);

    const items = useMemo(() => {
        let menu_items = [
            { id: 3, name: 'Settings', onClick: () => {} },
            {
                id: 4,
                name: 'Exit Game',
                onClick: () => exitGame()
            }
        ];

        if (savedGames?.length < 3) {
            menu_items.unshift({ id: 0, name: 'New Game', onClick: () => setOpenModal('new_game') });
        }

        if (savedGames?.length >= 1) {
            menu_items.unshift({
                id: 1,
                name: 'Load Game',
                onClick: () => setOpenModal('saved_games')
            });
        }

        if (lastPlayedGame) {
            menu_items.unshift({
                id: 5,
                name: 'Continue',
                onClick: () => setContext({ gameId: lastPlayedGame.id })
            });
        }
        return menu_items;
    }, [savedGames, lastPlayedGame, exitGame, handleSaveGame]);

    if (context?.gameId) {
        return null;
    }

    return (
        <div className={css['menu-container']} onKeyDown={handleMenu} tabIndex={1}>
            {!openModal && (
                <div className={css['menu-items-container']}>
                    {items.map((it) => {
                        return <MenuItem key={it.id} name={it.name} onClick={it.onClick} />;
                    })}
                </div>
            )}

            <Modal name="new_game" state={openModal} onClick={handleNewGame} onClose={() => setOpenModal(null)} />

            <Modal
                name="saved_games"
                state={openModal}
                items={savedGames}
                loading={loadingGames}
                sync={sync}
                onClose={() => {
                    setOpenModal(null);
                }}
            />
        </div>
    );
};
