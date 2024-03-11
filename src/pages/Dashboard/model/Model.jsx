import React, { useCallback, useMemo } from 'react';
import { useCommand, useTranslation, useDashboardContext } from '../../../hooks';
import { AdminModel } from '../../../models';
import { IsBoolean, matchSearch } from '../../../components/utils';

import { Table } from 'react-daisyui';
import { ItemToggle } from '../components';
import { Actions } from './Actions';

import css from './model.module.css';

export const Model = ({ current }) => {
    const { t } = useTranslation();
    const [context, setContext] = useDashboardContext();

    const [, , syncModel] = useCommand(
        {
            func: current.command,
            onSuccess: (response) => {
                setContext({ model: AdminModel.fromAPI(response, current) });
            }
        },
        []
    );

    const modelList = useMemo(() => {
        return context.model?.filter((item) => matchSearch([item.name, item.id], context.search));
    }, [context, matchSearch]);

    return (
        <div className={css['dashboard-model-table']}>
            <Table dataTheme="dark" zebra size="lg">
                <Table.Head>
                    {current.fields?.map((field, index) => {
                        return <span key={index}>{field && t(`dashboard.table.${current.name}.${field}`)}</span>;
                    })}
                </Table.Head>
                <Table.Body>
                    {modelList?.map((item, index) => (
                        <ModelRow key={index} item={item} current={current} sync={syncModel} />
                    ))}
                </Table.Body>
            </Table>
        </div>
    );
};

const ModelRow = ({ item, current, sync }) => {
    const getValue = useCallback(
        (value, field) => {
            if (!IsBoolean(value)) {
                return value;
            }
            return <ItemToggle item={item} value={value} field={field} sync={sync} />;
        },
        [item]
    );

    const cells = useMemo(() => {
        return [
            ...current.fields.filter((f) => f !== 'actions').map((field) => getValue(item.display(field), field)),
            <Actions key={`${current.name}_actions`} item={item} current={current} sync={sync} />
        ].filter(Boolean);
    }, [item, current]);

    return (
        <Table.Row>
            {cells.map((cell, index) => (
                <React.Fragment key={index}>{cell}</React.Fragment>
            ))}
        </Table.Row>
    );
};
