import { memo, useState } from 'react';
import PropTypes from 'prop-types';

import { Theme } from './components';
import { Sidebar, NavBar } from './components';
import { Model } from './model/Model';

import css from './dashboard.module.css';

export const Dashboard = memo(({ models, current }) => {
    const [state, setState] = useState([]);

    return (
        <Theme dataTheme="night" className={css['dashboard-main-container']}>
            <Sidebar models={models} active={current} setState={setState} />
            <NavBar current={current} />
            <div className={css['dashboard-model-block']}>
                <Model current={current} model={state} setModel={setState} />
            </div>
        </Theme>
    );
});

Dashboard.propTypes = {
    models: PropTypes.array,
    current: PropTypes.object.isRequired
};

Dashboard.defaultProps = {
    models: []
};
