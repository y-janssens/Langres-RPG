import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';
import Icon from '../../../components/ui/Icon';

import css from './ui.module.css';

const NavBar = () => {
    const navigate = useNavigate();
    const { t } = useTranslation();

    return (
        <div className={css['pathfinder-navbar-block']}>
            <div className={css['pathfinder-navbar']}>
                <span className={css['pathfinder-navbar-title']}>
                    <Icon name="menu" color="white" size="xl" cursor="initial" />
                    <span>{t('menu.items.pathfinder')}</span>
                </span>
                <span className={css['pathfinder-navbar-actions']}>
                    <Button dataTheme="emerald" className={css['pathfinder-navbar-exit']} size="md" color="primary" shape="square" onClick={() => navigate('/')}>
                        <Icon name="home" color="white" size="medium" />
                    </Button>
                </span>
            </div>
            <div className={css['pathfinder-navtitle']} />
        </div>
    );
};

export default NavBar;
