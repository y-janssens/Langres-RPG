import PropTypes from 'prop-types';

import { Theme } from './components';
import { Sidebar, NavBar } from './components';

import css from './dashboard.module.css';

export const Dashboard = ({ models, current, children }) => {
    return (
        <Theme dataTheme="night" className={css['dashboard-main-container']}>
            <Sidebar models={models} active={current} />
            <NavBar current={current} />
            {children}
        </Theme>
    );
};

Dashboard.propTypes = {
    children: PropTypes.node.isRequired,
    models: PropTypes.array,
    current: PropTypes.object
};

Dashboard.defaultProps = {
    children: {},
    models: [],
    current: null
};
