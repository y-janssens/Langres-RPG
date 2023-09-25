import { useCallback, useMemo, useState } from 'react';
import useGameContext from '../../hooks/useGameContext';
import { useTranslation } from 'react-i18next';
import { useGet } from '../../hooks/useGet';
import { exit } from '@tauri-apps/api/process';

import { MenuItem } from './MenuItem';
import Title from '../ui/Title';
import SavedGames from './SavedGames';
import NewGame from './NewGame';

import css from './menu.module.css';
import Settings from './Settings';

export const MainMenu = () => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [displayTitle, setDisplayTitle] = useState(true);
    const [context, setContext] = useGameContext();

    const [savedGames, loadingGames, , sync] = useGet({
        func: 'load_saves'
    });

    const handleMenu = useCallback(
        (event) => {
            if (openModal) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
                    setDisplayTitle(false);
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
            { id: 3, name: t('menu.items.settings'), onClick: () => setOpenModal('settings') },
            {
                id: 4,
                name: t('menu.items.exit'),
                onClick: async () => await exit(1)
            }
        ];

        if (savedGames?.length < 3) {
            menu_items.unshift({ id: 0, name: t('menu.items.new'), onClick: () => setOpenModal('new_game') });
        }

        if (savedGames?.length >= 1) {
            menu_items.unshift({
                id: 1,
                name: t('menu.items.load'),
                onClick: () => setOpenModal('saved_games')
            });
        }

        if (lastPlayedGame) {
            menu_items.unshift({
                id: 5,
                name: t('menu.items.continue'),
                onClick: () => setContext({ gameId: lastPlayedGame.id })
            });
        }
        return menu_items;
    }, [savedGames, lastPlayedGame]);

    if (context?.gameId) {
        return null;
    }

    return (
        <div className={css['menu-container']} onKeyDown={handleMenu} tabIndex={1}>
            {displayTitle ? (
                <Title title={t('flavor.main-title')} hide={() => setDisplayTitle(false)} />
            ) : (
                !openModal && (
                    <div className={css['menu-items-container']}>
                        {items.map((it) => {
                            return <MenuItem key={it.id} name={it.name} onClick={it.onClick} />;
                        })}
                    </div>
                )
            )}

            <NewGame state={openModal} sync={sync} onClose={() => setOpenModal(null)} />

            <SavedGames
                state={openModal}
                items={savedGames}
                loading={loadingGames}
                sync={sync}
                onClose={() => {
                    setOpenModal(null);
                }}
            />

            <Settings
                state={openModal}
                onClose={() => {
                    setOpenModal(null);
                    sync();
                }}
                context={context}
            />
        </div>
    );
};
