import React, { useMemo, useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Button } from 'react-daisyui';

import { useTranslation } from 'react-i18next';
import css from './ui.module.css';

const Sidebar = ({ models }) => {
    return (
        <div className={css['dashboard-sidebar']}>
            <div className={css['dashboard-sidebar-items']}>
                {models?.map((model, index) => (
                    <SideBarItem key={index} item={model} />
                ))}
            </div>
        </div>
    );
};

const SideBarItem = ({ item }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();
    const location = useLocation();

    const [isHover, setIsHover] = useState(false);

    const isActive = useMemo(() => {
        return location.pathname.replace('/admin/dashboard/', '') === item.name;
    }, [location, item]);

    return (
        <div className={css['dashboard-sidebar-item']}>
            <Button
                className={css[`dashboard-sidebar-item-${isActive ? 'active' : 'idle'}`]}
                dataTheme="emerald"
                size="md"
                color={isActive || isHover ? 'primary' : 'ghost'}
                variant={!isActive && isHover && 'outline'}
                fullWidth
                onClick={() => navigate(`/admin/dashboard/${item.name}`)}
                onMouseEnter={() => setIsHover(true)}
                onMouseLeave={() => setIsHover(false)}
            >
                {t(`dashboard.models.${item.name}`)}
            </Button>
        </div>
    );
};

export default Sidebar;
