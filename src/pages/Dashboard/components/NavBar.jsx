import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useDashboardContext from '../../../hooks/useDashboardContext';

import { Button, Input } from 'react-daisyui';
import { Locator } from './locator/Locator';
import Icon from '../../../components/ui/Icon';

import css from './ui.module.css';

const NavBar = ({ current }) => {
    const navigate = useNavigate();
    const [, setContext] = useDashboardContext();
    const { t } = useTranslation();

    return (
        <div className={css['dashboard-navbar-block']}>
            <div className={css['dashboard-navbar']}>
                <span className={css['dashboard-navbar-title']}>
                    <Icon name="menu" color="white" size="xl" cursor="initial" />
                    <span>{t(`dashboard.models.${current.name}`)}</span>
                </span>
                <span className={css['dashboard-navbar-actions']}>
                    <Input
                        className={css['dashboard-searchbar']}
                        dataTheme="dark"
                        color="neutral"
                        size="md"
                        onChange={({ target: { value } }) => setContext({ search: value })}
                        placeholder={`${t('common.actions.search')} ${t(`dashboard.models.${current.name}`).toLowerCase()}`}
                        disabled={!current.search}
                    />
                    {!current.unique && (
                        <Button dataTheme="emerald" className={css['dashboard-navbar-create']} size="md" color="primary" variant="outline" onClick={() => navigate('/')}>
                            <span className={css['dashboard-navbar-create-label']}>{t('common.actions.add')}</span>
                            <Icon name="plus" color="white" size="small" />
                        </Button>
                    )}
                    <Button dataTheme="emerald" className={css['dashboard-navbar-exit']} size="md" color="primary" shape="square" onClick={() => navigate('/')}>
                        <Icon name="home" color="white" size="medium" />
                    </Button>
                </span>
            </div>
            <div className={css['dashboard-navtitle']}>
                <Locator current={current} />
            </div>
        </div>
    );
};

export default NavBar;
