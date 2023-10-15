import { useCallback, useEffect, useMemo, useState } from 'react';
import { useRef } from 'react';
import useGameContext from '../../hooks/useGameContext';
import { useTranslation } from 'react-i18next';
import { useGet } from '../../hooks/useGet';
import { exit } from '@tauri-apps/api/process';

import { MenuItem } from './MenuItem';
import { Title, MainTitle } from '../ui/Title';
import SavedGames from './SavedGames';
import NewGame from './NewGame';

import css from './menu.module.css';
import Settings from './Settings';

export const MainMenu = () => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [context, setContext] = useGameContext();
    const [displayTitle, setDisplayTitle] = useState(!context.devMode);
    const [selected, setSelected] = useState(0);
    const activeRef = useRef();

    const [savedGames, loadingGames, sync] = useGet({
        func: 'load_saves'
    });

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
            { name: t('menu.items.settings'), onClick: () => setOpenModal('settings') },
            {
                name: t('menu.items.exit'),
                onClick: async () => await exit(1)
            }
        ];

        if (savedGames?.length < 3) {
            menu_items.unshift({ name: t('menu.items.new'), onClick: () => setOpenModal('new_game') });
        }

        if (savedGames?.length >= 1) {
            menu_items.unshift({
                name: t('menu.items.load'),
                onClick: () => setOpenModal('saved_games')
            });
        }

        if (lastPlayedGame) {
            menu_items.unshift({
                name: t('menu.items.continue'),
                onClick: () => setContext({ gameId: lastPlayedGame.id })
            });
        }

        return menu_items.map((it, index) => {
            it.id = index;
            return it;
        });
    }, [savedGames, lastPlayedGame]);

    const handleMenu = useCallback(
        (event) => {
            console.log(event.key);
            if (openModal) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
                    setDisplayTitle(false);
                }
            } else {
                switch (event.key) {
                    case 'ArrowDown':
                        setSelected((slt) => (slt + 1 <= items.length - 1 ? slt + 1 : 0));
                        break;
                    case 'ArrowUp':
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
        activeRef.current.focus();
        // if (context.devMode) {
        //     setContext({ gameId: 1382165055 });
        // }
    }, []);

    if (context?.gameId) {
        return null;
    }

    return (
        <div className={css['menu-container']} onKeyDown={handleMenu} tabIndex={1} ref={activeRef}>
            {displayTitle ? (
                <Title title={t('flavor.main-title')} hide={() => setDisplayTitle(false)} />
            ) : (
                !openModal && (
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
