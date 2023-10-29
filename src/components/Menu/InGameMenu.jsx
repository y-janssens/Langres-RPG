import { useCallback, useMemo, useState, useEffect, useRef } from 'react';
import { useGameContext } from '../../hooks';
import { useTranslation } from 'react-i18next';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import Settings from './Settings';

import css from './menu.module.css';

export const InGameMenu = ({ id, game }) => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [context, , removeFromContext] = useGameContext();
    const [selected, setSelected] = useState(0);
    const activeRef = useRef();

    const displayInGameMenu = useMemo(() => {
        return id && context.controls.toggles.menu;
    }, [id, context, context.controls.toggles]);

    const handleSaveGame = useCallback(() => {
        let _game = new GameModel(game);
        _game.save();
    }, [game]);

    const items = useMemo(() => {
        return [
            { id: 0, name: t('menu.items.save'), onClick: () => handleSaveGame() },
            { id: 1, name: t('menu.items.settings'), onClick: () => setOpenModal('settings') },
            {
                id: 2,
                name: t('menu.items.exit-game'),
                onClick: () => {
                    // Remove game related content from context
                    removeFromContext(['gameId', 'game', 'world', 'map']);
                    // Reset keyboard controls default values
                    context.controls.generateControls();
                }
            }
        ];
    }, [handleSaveGame, context, removeFromContext]);

    const handleMenu = useCallback(
        (event) => {
            console.log(event.key);
            if (openModal) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
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
        activeRef.current?.focus();
    }, []);

    if (!displayInGameMenu) {
        return null;
    }

    return (
        <div className={css['ingame-menu-items-container']} onKeyDown={handleMenu} tabIndex={1} ref={activeRef}>
            {/* <div className={css['menu-items-block']}> */}
            {items.map((it) => {
                return <MenuItem key={it.id} active={selected === it.id} name={it.name} onClick={it.onClick} />;
            })}
            {/* </div> */}
            <Settings
                state={openModal}
                onClose={() => {
                    setOpenModal(null);
                }}
                context={context}
            />
        </div>
    );
};
