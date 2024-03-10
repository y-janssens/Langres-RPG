import PropTypes from 'prop-types';

import { useDashboardContext } from '../../hooks';
import { Theme, Sidebar, NavBar, Modal } from './components';

import css from './dashboard.module.css';

export const Dashboard = ({ models, current, children }) => {
    const [context] = useDashboardContext();
    return (
        <Theme dataTheme="night" className={css['dashboard-main-container']}>
            <Sidebar models={models} active={current} />
            <NavBar current={current} />
            <div className={css['dashboard-model-block']}>{context.instance ? <Modal current={current} /> : children}</div>
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
