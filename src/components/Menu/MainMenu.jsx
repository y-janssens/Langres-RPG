import { useCallback, useEffect, useMemo, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { GameModel } from '../../models';
import { useGameContext, useTranslation } from '../../hooks';
import { exit } from '@tauri-apps/api/process';

import { MenuItem } from './MenuItem';
import { Title, MainTitle } from '../ui/Title';
import SavedGames from './SavedGames';
import NewGame from './NewGame';
import Settings from './Settings';

import css from './menu.module.css';

export const MainMenu = () => {
    const { t } = useTranslation();

    const navigate = useNavigate();
    const [engine, setEngine] = useGameContext();
    const [selected, setSelected] = useState(0);
    const [openModal, setOpenModal] = useState(null);
    const [displayTitle, setDisplayTitle] = useState(!engine.settings.devMode);
    const activeRef = useRef();

    const [savedGames, , sync] = GameModel.useCommand();

    const items = useMemo(() => {
        const elements = engine.applicationData?.main_menu_items || [];
        return elements?.map((it, index) => {
            let func = () => {};
            if (it.func) {
                switch (it.func?.type) {
                    case 'popup':
                        func = () => setOpenModal(it.func.value);
                        break;
                    case 'link':
                        func = () => navigate(it.func.value);
                        break;
                    case 'exit':
                        func = async () => await exit(1);
                        break;
                    default:
                        func = () => setEngine({ gameId: it.func.value });
                        break;
                }
            }
            return {
                key: index,
                name: t(`menu.items.${it.name}`),
                onClick: () => func()
            };
        });
    }, [engine.applicationData]);

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
        // navigate('admin/editor');
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
