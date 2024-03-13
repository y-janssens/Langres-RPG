import { useCallback, useEffect, useMemo, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useGameContext, useCommand, useTranslation, useAdminContext } from '../../hooks';
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
    const [displayTitle, setDisplayTitle] = useState(!engine.devMode);
    const activeRef = useRef();

    const [savedGames, , sync] = useCommand({
        func: 'load_games'
    });

    const lastPlayedGame = useMemo(() => {
        if (!savedGames?.some((gm) => Boolean(gm.last_save_date))) {
            return null;
        }
        let games = savedGames?.map((gm) => ({
            id: gm.id,
            date: new Date(gm.last_save_date.split('.')[0])
        }));
        return games.sort((a, b) => a.date < b.date)[0];
    }, [savedGames]);

    const items = useMemo(() => {
        let menu_items = [
            lastPlayedGame && {
                id: 0,
                name: t('menu.items.continue'),
                onClick: () => setEngine({ gameId: lastPlayedGame.id })
            },
            savedGames?.length >= 1 && {
                id: 1,
                name: t('menu.items.load'),
                onClick: () => setOpenModal('saved_games')
            },
            savedGames?.length < 3 && {
                id: 2,
                name: t('menu.items.new'),
                onClick: () => setOpenModal('new_game')
            },
            {
                id: 3,
                name: t('menu.items.settings'),
                onClick: () => {
                    setOpenModal('settings');
                }
            },
            isAdmin && {
                id: 4,
                name: t('menu.items.builder'),
                onClick: () => navigate('admin/editor')
            },
            isAdmin && {
                id: 5,
                name: t('menu.items.dashboard'),
                onClick: () => navigate('admin/dashboard')
            },
            {
                id: 6,
                name: t('menu.items.exit'),
                onClick: async () => await exit(1)
            }
        ];

        return menu_items
            .filter(Boolean)
            .sort((a, b) => a.id - b.id)
            .map((it) => it);
    }, [savedGames, lastPlayedGame]);

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
                        items.find((it) => it.id === selected).onClick();
                }
            }
        },
        [openModal, items, selected]
    );

    useEffect(() => {
        if (!engine.gameId && (!engine.controls?.toggles?.pause || !engine.controls?.toggles?.menu)) {
            activeRef.current.focus();
        }
        // setEngine({ gameId: 1182534022 });
    }, []);

    // useEffect(() => {
    //     navigate('admin/dashboard');
    // }, []);

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
                                return <MenuItem active={selected === it.id} key={it.id} name={it.name} onClick={it.onClick} />;
                            })}
                        </div>
                    </div>
                </>
            )}

            {openModal === 'new_game' && <NewGame state={openModal} sync={sync} onClose={() => setOpenModal(null)} />}

            {openModal === 'saved_games' && (
                <SavedGames
                    state={openModal}
                    items={savedGames}
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
