import React, { useCallback, useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';

import css from './ui.module.css';

const Sidebar = ({ models, active, setState }) => {
    return (
        <div className={css['dashboard-sidebar']}>
            <div className={css['dashboard-sidebar-items']}>
                {models
                    ?.sort((a, b) => a.id - b.id)
                    .map((model, index) => (
                        <SideBarItem key={index} item={model} active={active} setState={setState} />
                    ))}
            </div>
        </div>
    );
};

const SideBarItem = ({ item, active, setState }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();
    const [isHover, setIsHover] = useState(false);

    const isActive = useMemo(() => {
        return active.name === item.name;
    }, [active, item]);

    const handleRedirect = useCallback(() => {
        setState([]);
        navigate(`/admin/dashboard/${item.name}`);
    }, [item]);

    return (
        <div className={css['dashboard-sidebar-item']}>
            <Button
                className={css[`dashboard-sidebar-item-${isActive ? 'active' : 'idle'}`]}
                dataTheme="emerald"
                size="md"
                color={isActive || isHover ? 'primary' : 'ghost'}
                variant={!isActive && isHover && 'outline'}
                fullWidth
                onClick={handleRedirect}
                onMouseEnter={() => setIsHover(true)}
                onMouseLeave={() => setIsHover(false)}
            >
                {t(`dashboard.models.${item.name}`)}
            </Button>
        </div>
    );
};

export default Sidebar;
