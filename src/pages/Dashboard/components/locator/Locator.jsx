import { useLocation, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import css from './locator.module.css';

export const Locator = ({ current }) => {
    const location = useLocation();
    const items = location.pathname.replace('/admin/', '').split('/');
    return (
        <div className={css['locator-block']}>
            {items.map((item, index) => (
                <LocatorItem key={index} current={current} item={item} index={index} />
            ))}
        </div>
    );
};

const LocatorItem = ({ item, current, index }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();

    switch (index) {
        case 0:
            return <span className={css['locator-root']} onClick={() => navigate('/admin/dashboard/game')}>{`${t('menu.items.dashboard')}/ `}</span>;
        case 1:
            return <span onClick={() => navigate(`/admin/dashboard/${current.name}`)}>{`${current.name}/`}</span>;
        default:
            return <span>{item}</span>;
    }
};
