import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

import { Button } from 'react-daisyui';
import { Icon } from '../../../components';
import { Toggle } from '../../Builder/components';

import css from './ui.module.css';

const NavBar = ({ form, setForm }) => {
    const navigate = useNavigate();
    const { t } = useTranslation();

    return (
        <div className={css['tools-navbar-block']}>
            <div className={css['tools-navbar']}>
                <span className={css['tools-navbar-title']}>
                    <Icon name="menu" color="white" size="xl" cursor="initial" />
                    <span>{t('menu.items.tools')}</span>
                </span>
                <span className={css['tools-navbar-actions']}>
                    <Button dataTheme="emerald" className={css['tools-navbar-exit']} size="md" color="primary" shape="square" onClick={() => navigate('/')}>
                        <Icon name="home" color="white" size="medium" />
                    </Button>
                </span>
            </div>
            <div className={css['tools-navtitle']}>
                <Toggle title={t('builder.toggles.ids')} active={form.displayIds} onChange={() => setForm('displayIds', !form.displayIds)} />
                <Toggle title={t('builder.toggles.coordinates')} active={form.displayCoordinates} onChange={() => setForm('displayCoordinates', !form.displayCoordinates)} />
            </div>
        </div>
    );
};

export default NavBar;
