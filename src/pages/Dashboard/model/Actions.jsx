import { useCallback, useState } from 'react';
import { Button, Dropdown } from 'react-daisyui'; //eslint-disable-line
import Icon from '../../../components/ui/Icon';

import css from '../dashboard.module.css';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';

export const Actions = ({ item, current }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();
    const [toggle, setToggle] = useState(false); //eslint-disable-line

    const handleActions = useCallback((action) => {
        switch (action) {
            case 'edit':
                navigate(`/admin/dashboard/${current.name}/${item.id}`);
                break;
            case 'delete':
                //@Todo
                break;
            default:
                break;
        }
    });

    return (
        <Dropdown className={css['dashboard-model-actions']} dataTheme="dark">
            <Dropdown.Toggle>
                <Icon name="actions" color="white" size="default" />
            </Dropdown.Toggle>
            <Dropdown.Menu className="w-52">
                {current.actions.map((act, index) => (
                    <Dropdown.Item key={index} onClick={() => handleActions(act)}>
                        {t(`common.actions.${act}`)}
                    </Dropdown.Item>
                ))}
            </Dropdown.Menu>
        </Dropdown>
        // <Button className={css['dashboard-model-actions']} dataTheme="emerald" size="xs" color="ghost" onClick={() => setToggle(!toggle)}>
        //     <Icon name="actions" color="white" size="default" />
        // </Button>
    );
};
