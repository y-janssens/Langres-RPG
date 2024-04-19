import { useCallback, useMemo, useState, useEffect, useRef } from 'react';
import { useGameContext, useTranslation } from '../../hooks';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import Settings from './Settings';

import css from './menu.module.css';

export const InGameMenu = ({ id, form }) => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState(null);
    const [engine, setEngine, removeFromEngine] = useGameContext();
    const [selected, setSelected] = useState(0);
    const activeRef = useRef();

    const displayInGameMenu = useMemo(() => {
        return id && engine.controls.toggles.menu;
    }, [id, engine, engine.controls]);

    const handleContinue = useCallback(
        (save = false) => {
            if (save) {
                let game = new GameModel(form);
                if (!engine.mapId || engine.mapId?.is_final) {
                    game.last_known_position = { x: Math.abs(engine.controls.positions[0]), y: Math.abs(engine.controls.positions[2]), id: engine.controls.currentTile.id };
                }
                game.save();
            }
            engine.controls.generateControls();
            setEngine({ controls: engine.controls });
        },
        [form, engine.controls, engine.controls.currentTile, engine.mapId]
    );

    const items = useMemo(() => {
        return [
            { id: 0, name: t('menu.items.continue'), onClick: () => handleContinue() },
            { id: 1, name: t('menu.items.save'), onClick: () => handleContinue(true) },
            {
                id: 2,
                name: t('menu.items.settings'),
                onClick: () => {
                    setOpenModal('settings');
                    setEngine({ pauseMenu: true });
                }
            },
            {
                id: 3,
                name: t('menu.items.exit-game'),
                onClick: () => {
                    // Remove game related content from engine
                    removeFromEngine(['gameId', 'world']);
                    // Reset keyboard controls default values
                    engine.controls.generateControls();
                }
            }
        ];
    }, [handleContinue, engine, removeFromEngine]);

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
                        setEngine({ pauseMenu: false });
                    }}
                    engine={engine}
                />
            </div>
        </div>
    );
};
