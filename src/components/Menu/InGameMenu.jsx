import { useCallback, useMemo, useState, useEffect, useRef } from 'react';
import { useGameContext, useSettingsProperties, useTranslation } from '../../hooks';

import { GameModel } from '../../models';

import { MenuItem } from './MenuItem';
import MenuModals from './MenuModals';

import css from './menu.module.css';

export const InGameMenu = ({ id, form }) => {
    const { t } = useTranslation();
    const activeRef = useRef();
    const [engine, setEngine, removeFromEngine] = useGameContext();
    const { collisions } = useSettingsProperties({ keys: 'collisions' }, [engine]);
    const [openModal, setOpenModal] = useState({ type: null, open: false });
    const [selected, setSelected] = useState(0);
    const [menuItems, setMenuItems] = useState([]);

    const displayInGameMenu = useMemo(() => {
        return id && engine.controls.toggles.menu;
    }, [id, engine, engine.controls]);

    const handleContinue = useCallback(
        (save = false) => {
            if (save && !collisions) return;

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
        [form, engine.controls, engine.mapId, collisions]
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
                        func = () => handleContinue(Boolean(it.func.value !== 'continue'));
                        break;
                }
            }
            return {
                key: index,
                name: t(`menu.items.${it.name}`),
                onClick: () => func(),
                disabled: it.name === 'save' && !collisions
            };
        });
        setMenuItems(items);
    }, [engine.applicationData, handleContinue, removeFromEngine, collisions]);

    const handleMenu = useCallback(
        (event) => {
            if (!openModal.type && !openModal.open) {
                const enabledMenuItems = menuItems.filter((item) => !item.disabled);
                return engine.controls.keyBoardMenuSelect(event, enabledMenuItems, selected, setSelected);
            }

            if (event.key === 'Escape') {
                setOpenModal({ type: null, open: false });
            }
        },
        [openModal, menuItems, selected, engine]
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
                    return <MenuItem key={it.key} active={selected === it.key} name={it.name} onClick={it.onClick} disabled={it.disabled} />;
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
