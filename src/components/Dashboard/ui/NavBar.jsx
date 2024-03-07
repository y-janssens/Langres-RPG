import React from 'react';
import { Button } from 'react-daisyui';
import css from './ui.module.css';

const NavBar = ({ engine, setEngine }) => {
    return (
        <div className={css['dashboard-navbar-block']}>
            <div className={css['dashboard-navbar']}>
                <div className={css['dashboard-navbar-toggles']}>
                    <Button dataTheme="business" className={css['dashboard-navbar-exit']} size="xs" color="accent" shape="square" onClick={() => setEngine({ dashboard: false })}>
                        x
                    </Button>
                </div>
            </div>
            <div className={css['dashboard-navtitle']}></div>
        </div>
    );
};

export default NavBar;
