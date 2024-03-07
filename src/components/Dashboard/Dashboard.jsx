import React from 'react';
import { Theme } from './ui';
import css from './dashboard.module.css';
import { Sidebar, NavBar } from './ui';
import { useGameContext } from '../../hooks';

export const Dashboard = () => {
    const [engine, setEngine] = useGameContext();
    return (
        <Theme dataTheme="night" className={css['dashboard-main-container']}>
            <Sidebar />
            <NavBar engine={engine} setEngine={setEngine} />
        </Theme>
    );
};
