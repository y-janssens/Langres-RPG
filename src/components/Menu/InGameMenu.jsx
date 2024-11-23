import { useCallback, useMemo, useState, useEffect, useRef } from 'react';
import { useGameContext, useTranslation } from '../../hooks';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import MenuModals from './MenuModals';

import css from './menu.module.css';

export const InGameMenu = ({ id, form }) => {
    const { t } = useTranslation();
    const [openModal, setOpenModal] = useState({ type: null, open: false });
    const [engine, setEngine, removeFromEngine] = useGameContext();
    const [selected, setSelected] = useState(0);
    const [menuItems, setMenuItems] = useState([]);
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

    const getOrUpdateMenuItems = useCallback(async () => {
        await engine.applicationData.load().then((resp) => {
            setEngine('applicationData', resp);
        });
        const elements = engine.applicationData?.ingame_menu_items || [];
        const items = elements?.map((it, index) => {
            let func = () => {};
            if (it.func) {
                switch (it.func.type) {
                    case 'popup':
                        func = () => {
                            setOpenModal({ type: 'settings', open: true });
                            setEngine({ pauseMenu: true });
                        };
                        break;
                    case 'exit':
                        func = async () => {
                            // Remove game related content from engine
                            removeFromEngine(['gameId', 'world']);
                            // Reset keyboard controls default values
                            engine.controls.generateControls();
                        };
                        break;
                    default:
                        func = () => handleContinue(Boolean(it.func.type === 'continue'));
                        break;
                }
            }
            return {
                key: index,
                name: t(`menu.items.${it.name}`),
                onClick: () => func()
            };
        });
        setMenuItems(items);
    }, [engine.applicationData, handleContinue, removeFromEngine]);

    const handleMenu = useCallback(
        (event) => {
            if (openModal.type && openModal.open && displayInGameMenu) {
                if (event.key === 'Escape') {
                    setOpenModal({ type: null, open: false });
                }
            } else {
                switch (event.key) {
                    case 'ArrowDown':
                    case 's':
                        setSelected((slt) => (slt + 1 <= menuItems.length - 1 ? slt + 1 : 0));
                        break;
                    case 'ArrowUp':
                    case 'z':
                        setSelected((slt) => (slt - 1 >= 0 ? slt - 1 : menuItems.length - 1));
                        break;
                    case 'Enter':
                        menuItems.find((it) => it.key === selected).onClick();
                }
            }
        },
        [openModal, menuItems, selected, displayInGameMenu]
    );

    useEffect(() => {
        if (displayInGameMenu) {
            activeRef.current?.focus();
            getOrUpdateMenuItems();
        }
    }, [displayInGameMenu, getOrUpdateMenuItems]);

    return (
        <div className={css['ingame-menu-items-container']} onKeyDown={handleMenu} tabIndex={1} ref={activeRef}>
            <div className={css['ingame-menu-items-block']}>
                {menuItems.map((it) => {
                    return <MenuItem key={it.key} active={selected === it.key} name={it.name} onClick={it.onClick} />;
                })}
                <MenuModals
                    item={openModal}
                    onClose={() => {
                        setOpenModal({ type: null, open: false });
                        setEngine({ pauseMenu: false });
                    }}
                />
            </div>
        </div>
    );
};
