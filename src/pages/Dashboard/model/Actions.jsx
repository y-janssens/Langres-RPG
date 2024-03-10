import { useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

import { Dropdown } from 'react-daisyui';
import Icon from '../../../components/ui/Icon';

import css from './model.module.css';

export const Actions = ({ item, current }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();

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
    );
};
