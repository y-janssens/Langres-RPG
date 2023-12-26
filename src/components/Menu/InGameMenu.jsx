import { useCallback, useMemo, useState, useEffect, useRef } from 'react';
import { useGameContext } from '../../hooks';
import { useTranslation } from 'react-i18next';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import Settings from './Settings';

import css from './menu.module.css';

export const InGameMenu = ({ id, form }) => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [context, setContext, removeFromContext] = useGameContext();
    const [selected, setSelected] = useState(0);
    const activeRef = useRef();

    const displayInGameMenu = useMemo(() => {
        return id && context.controls.toggles.menu;
    }, [id, context, context.controls.toggles]);

    const handleSaveGame = useCallback(() => {
        let game = new GameModel(form);
        if (!context.mapId || context.mapId?.is_final) {
            game.last_known_position = { x: Math.abs(context.controls.positions[0]), y: Math.abs(context.controls.positions[2]) };
        }
        game.save();
        context.controls.generateControls();
        setContext({ controls: context.controls });
    }, [form, context]);

    const items = useMemo(() => {
        return [
            { id: 0, name: t('menu.items.save'), onClick: () => handleSaveGame() },
            {
                id: 1,
                name: t('menu.items.settings'),
                onClick: () => {
                    setOpenModal('settings');
                    setContext({ pauseMenu: true });
                }
            },
            {
                id: 2,
                name: t('menu.items.exit-game'),
                onClick: () => {
                    // Remove game related content from context
                    removeFromContext(['gameId', 'world']);
                    // Reset keyboard controls default values
                    context.controls.generateControls();
                }
            }
        ];
    }, [handleSaveGame, context, removeFromContext]);

    const handleMenu = useCallback(
        (event) => {
            if (openModal && displayInGameMenu) {
                if (event.key === 'Escape') {
                    setOpenModal(null);
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
        [openModal, items, selected, displayInGameMenu]
    );

    useEffect(() => {
        if (displayInGameMenu) {
            activeRef.current?.focus();
        }
    }, [displayInGameMenu]);

    return (
        <div className={css['ingame-menu-items-container']} onKeyDown={handleMenu} tabIndex={1} ref={activeRef}>
            <div className={css['ingame-menu-items-block']}>
                {items.map((it) => {
                    return <MenuItem key={it.id} active={selected === it.id} name={it.name} onClick={it.onClick} />;
                })}
                <Settings
                    state={openModal}
                    onClose={() => {
                        setOpenModal(null);
                        setContext({ pauseMenu: false });
                    }}
                    context={context}
                />
            </div>
        </div>
    );
};
