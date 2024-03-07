import { useNavigate } from 'react-router-dom';
import { Button } from 'react-daisyui';
import css from './ui.module.css';
import { Locator } from './locator/Locator';

const NavBar = ({ current }) => {
    const navigate = useNavigate();

    return (
        <div className={css['dashboard-navbar-block']}>
            <div className={css['dashboard-navbar']}>
                <div className={css['dashboard-navbar-toggles']}>
                    <Button dataTheme="business" className={css['dashboard-navbar-exit']} size="xs" color="accent" shape="square" onClick={() => navigate('/')}>
                        x
                    </Button>
                </div>
            </div>
            <div className={css['dashboard-navtitle']}>
                <Locator current={current} />
            </div>
        </div>
    );
};

export default NavBar;
