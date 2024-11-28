import { useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';

import { Dropdown } from 'react-daisyui';
import { Icon } from '../../../components';

import css from './model.module.css';

export const Actions = ({ item, current, sync }) => {
    const { t } = useTranslation();
    const navigate = useNavigate();

    const handleExport = useCallback(() => {
        navigator.clipboard.writeText(JSON.stringify(item.instance, null, 2));
    }, [item]);

    const handleActions = useCallback(
        (action) => {
            switch (action) {
                case 'edit':
                    navigate(`/admin/dashboard/${current.name}/${item.id}`);
                    break;
                case 'export':
                    handleExport();
                    break;
                case 'delete':
                    item.delete().then(() => {
                        sync();
                    });
                    break;
                default:
                    break;
            }
        },
        [item, current, sync]
    );

    return (
        <Dropdown className={css['dashboard-model-actions']} dataTheme="dark">
            <Dropdown.Toggle>
                <Icon name="actions" color="white" size="default" />
            </Dropdown.Toggle>
            <Dropdown.Menu>
                {current.actions.map((act, index) => (
                    <Dropdown.Item className={css[`dashboard-model-actions-${act}`]} key={index} onClick={() => handleActions(act)}>
                        {t(`common.actions.${act}`)}
                    </Dropdown.Item>
                ))}
            </Dropdown.Menu>
        </Dropdown>
    );
};
