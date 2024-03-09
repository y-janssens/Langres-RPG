import PropTypes from 'prop-types';

import { Theme, Sidebar, NavBar } from './components';

import css from './dashboard.module.css';

export const Dashboard = ({ models, current, children }) => {
    return (
        <Theme dataTheme="night" className={css['dashboard-main-container']}>
            <Sidebar models={models} active={current} />
            <NavBar current={current} />
            <div className={css['dashboard-model-block']}>{children}</div>
        </Theme>
    );
};

Dashboard.propTypes = {
    models: PropTypes.array,
    current: PropTypes.object.isRequired
};

Dashboard.defaultProps = {
    models: []
};
