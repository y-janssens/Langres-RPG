import { useCallback, useEffect, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useGameContext, useTranslation } from '../../hooks';
import { exit } from '@tauri-apps/api/process';

import { Title, MainTitle } from '../ui/Title';
import { MenuItems } from './MenuItems';
import MenuModals from './MenuModals';

import css from './menu.module.css';

export const MainMenu = () => {
    const { t } = useTranslation();

    const navigate = useNavigate();
    const [engine, setEngine] = useGameContext();
    const [selected, setSelected] = useState(0);
    const [openModal, setOpenModal] = useState({ type: null, open: false });
    const [displayTitle, setDisplayTitle] = useState(!engine.settings.devMode);
    const [menuItems, setMenuItems] = useState([]);

    const activeRef = useRef();

    const getOrUpdateMenuItems = useCallback(async () => {
        await engine.applicationData.load().then((resp) => {
            setEngine('applicationData', resp);
        });
        const elements = engine.applicationData?.main_menu_items || [];
        const items = elements.map((it, index) => {
            let func = () => {};
            if (it.func) {
                switch (it.func?.type) {
                    case 'popup':
                        func = () => setOpenModal({ type: it.func.value, open: true });
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
        setMenuItems(items);
    }, [engine.applicationData]);

    const handleMenu = useCallback(
        (event) => {
            if (openModal.type && openModal.open) {
                if (event.key === 'Escape') {
                    setOpenModal({ type: null, open: false });
                    setDisplayTitle(false);
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
        [openModal, menuItems, selected]
    );

    useEffect(() => {
        if (!engine.gameId && (!engine.controls?.toggles?.pause || !engine.controls?.toggles?.menu)) {
            activeRef.current.focus();
        }
        getOrUpdateMenuItems();
    }, [engine.applicationData, getOrUpdateMenuItems]);

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
                    <MenuItems items={menuItems} selected={selected} />
                    <MenuModals
                        item={openModal}
                        onClose={() => {
                            setOpenModal({ type: null, open: false });
                            getOrUpdateMenuItems();
                        }}
                    />
                </>
            )}
        </div>
    );
};
