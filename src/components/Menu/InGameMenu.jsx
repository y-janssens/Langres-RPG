import { useCallback, useMemo, useState } from 'react';
import useGameContext from '../../hooks/useGameContext';
import { useTranslation } from 'react-i18next';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import Settings from './Settings';

import css from './menu.module.css';

export const InGameMenu = ({ id, game }) => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [context, , removeFromContext] = useGameContext();

    const displayInGameMenu = useMemo(() => {
        return id && context.controls.toggles.menu;
    }, [id, context, context.controls.toggles]);

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

    if (!displayInGameMenu) {
        return null;
    }

    return (
        <div className={css['ingame-menu-items-container']} onKeyDown={handleMenu} tabIndex={1}>
            {items.map((it) => {
                return <MenuItem key={it.id} name={it.name} onClick={it.onClick} />;
            })}
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
