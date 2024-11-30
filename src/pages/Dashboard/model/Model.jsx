import React, { useCallback, useMemo } from 'react';
import { useTranslation, useDashboardContext } from '../../../hooks';
import { AdminModel } from '../../../models';
import { IsBoolean, matchSearch } from '../../../utils';

import { Table } from 'react-daisyui';
import { ItemToggle } from '../components';
import { Actions } from './Actions';

import css from './model.module.css';

export const Model = ({ current }) => {
    const { t } = useTranslation();
    const [context, setContext] = useDashboardContext();

    const [model, loadingModel, syncModel] = AdminModel.getInstance(current.model).useCommand(
        {
            useLoader: true,
            onSuccess: (response) => {
                setContext({ model: response });
            }
        },
        [current.model]
    );

    const modelList = useMemo(() => {
        if (!model || loadingModel) {
            return [];
        }
        return model?.filter((item) => matchSearch([item.name, item.id], context.search));
    }, [model, loadingModel, context, matchSearch]);

    return (
        <div className={css['dashboard-model-table']}>
            <Table dataTheme="dark" zebra size="lg">
                <Table.Head>
                    {current.fields
                        ?.filter((f) => f.primary)
                        .map((field, index) => {
                            return <span key={index}>{field && t(`dashboard.table.${current.name}.${field.name}`)}</span>;
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
            ...current.fields.filter((f) => f !== 'actions' && f.primary).map((field) => getValue(item.display(field.name), field.name)),
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
