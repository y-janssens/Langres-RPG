import { useCallback, useEffect, useMemo, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { GameModel } from '../../models';
import { useGameContext, useTranslation, useAdminContext } from '../../hooks';
import { exit } from '@tauri-apps/api/process';

import { MenuItem } from './MenuItem';
import { Title, MainTitle } from '../ui/Title';
import SavedGames from './SavedGames';
import NewGame from './NewGame';

import Settings from './Settings';
import css from './menu.module.css';

export const MainMenu = () => {
    const { t } = useTranslation();
    const { isAdmin } = useAdminContext();
    const navigate = useNavigate();
    const [engine, setEngine] = useGameContext();
    const [selected, setSelected] = useState(0);
    const [openModal, setOpenModal] = useState(null);
    const [displayTitle, setDisplayTitle] = useState(!engine.settings.devMode);
    const activeRef = useRef();

    const [savedGames, , sync] = GameModel.useCommand();

    const lastPlayedGame = useMemo(() => {
        if (!savedGames?.some((gm) => gm.visible && Boolean(gm.last_save_date))) {
            return null;
        }
        let games = savedGames
            ?.filter((gm) => gm.visible)
            .map((gm) => ({
                id: gm.id,
                date: new Date(gm.last_save_date.split('.')[0])
            }));
        return games.sort((a, b) => a.date < b.date)[0];
    }, [savedGames]);

    const items = useMemo(() => {
        const games = savedGames?.filter((gm) => gm.visible);
        let menu_items = [
            lastPlayedGame && {
                name: t('menu.items.continue'),
                onClick: () => setEngine({ gameId: lastPlayedGame.id })
            },
            games?.length >= 1 && {
                name: t('menu.items.load'),
                onClick: () => setOpenModal('saved_games')
            },
            games?.length < 3 && {
                name: t('menu.items.new'),
                onClick: () => setOpenModal('new_game')
            },
            {
                name: t('menu.items.settings'),
                onClick: () => {
                    setOpenModal('settings');
                }
            },
            isAdmin && {
                name: t('menu.items.builder'),
                onClick: () => navigate('admin/editor')
            },
            isAdmin && {
                name: t('menu.items.dashboard'),
                onClick: () => navigate('admin/dashboard')
            },
            isAdmin && {
                name: t('menu.items.pathfinder'),
                onClick: () => navigate('admin/pathfinder')
            },
            {
                name: t('menu.items.exit'),
                onClick: async () => await exit(1)
            }
        ];

        return menu_items.filter(Boolean).map((it, index) => ({ ...it, key: index }));
    }, [savedGames, lastPlayedGame, isAdmin]);

    const handleMenu = useCallback(
        (event) => {
            if (openModal) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
                    setDisplayTitle(false);
                }
            } else {
                switch (event.key) {
                    case 'ArrowDown':
                    case 's':
                        setSelected((slt) => (slt + 1 <= items.length - 1 ? slt + 1 : 0));
                        break;
                    case 'ArrowUp':
                    case 'z':
                        setSelected((slt) => (slt - 1 >= 0 ? slt - 1 : items.length - 1));
                        break;
                    case 'Enter':
                        items.find((it) => it.key === selected).onClick();
                }
            }
        },
        [openModal, items, selected]
    );

    useEffect(() => {
        if (!engine.gameId && (!engine.controls?.toggles?.pause || !engine.controls?.toggles?.menu)) {
            activeRef.current.focus();
        }
        // setEngine({ gameId: 'a9f3e7de-ffa0-4a2b-bf29-c0e8db7351be' });
        // navigate('admin/pathfinder');
    }, []);

    if (engine.gameId) {
        return null;
    }

    return (
        <div className={css['menu-container']} onKeyDown={handleMenu} tabIndex={1} ref={activeRef}>
            {displayTitle ? (
                <Title title={t('flavor.main-title')} hide={() => setDisplayTitle(false)} />
            ) : (
                <>
                    <MainTitle />
                    <div className={css['menu-items-container']}>
                        <div className={css['menu-items-block']}>
                            {items.map((it) => {
                                return <MenuItem active={selected === it.key} key={it.key} name={it.name} onClick={it.onClick} />;
                            })}
                        </div>
                    </div>
                </>
            )}

            {openModal === 'new_game' && <NewGame state={openModal} sync={sync} onClose={() => setOpenModal(null)} />}

            {openModal === 'saved_games' && (
                <SavedGames
                    state={openModal}
                    items={savedGames.filter((gm) => gm.visible)}
                    loading={false}
                    sync={sync}
                    onClose={() => {
                        setOpenModal(null);
                    }}
                />
            )}

            {openModal === 'settings' && (
                <Settings
                    state={openModal}
                    onClose={() => {
                        setOpenModal(null);
                        sync();
                    }}
                    engine={engine}
                />
            )}
        </div>
    );
};
