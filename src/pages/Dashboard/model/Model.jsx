import React, { useMemo } from 'react';
import { useCommand, useTranslation, useDashboardContext } from '../../../hooks';
import { AdminModel } from '../../../models';
import { matchSearch } from '../../../components/utils';

import { Table, Checkbox } from 'react-daisyui';
import { Actions } from './Actions';

export const Model = ({ current }) => {
    const { t } = useTranslation();
    const [context, setContext] = useDashboardContext();

    useCommand(
        {
            func: current.command,
            onSuccess: (response) => {
                setContext({ model: AdminModel.fromAPI(response, current.model) });
            }
        },
        []
    );

    const fields = useMemo(() => {
        if (!current.search) {
            return current.fields;
        }

        let _fields = [...current.fields];
        _fields.unshift(null);
        return _fields;
    }, [current]);

    const modelList = useMemo(() => {
        if (!context || !context.model?.length) {
            return [];
        }

        return context.model.filter((item) => matchSearch([item.name, item.id], context.search));
    }, [context]);

    return (
        <Table dataTheme="dark" zebra size="lg">
            <Table.Head>
                {fields?.map((field, index) => {
                    return <span key={index}>{field && t(`dashboard.table.${current.name}.${field}`)}</span>;
                })}
            </Table.Head>

            {context.model?.length > 0 && (
                <Table.Body>
                    {modelList.map((item, index) => (
                        <ModelRow key={index} item={item} current={current} />
                    ))}
                </Table.Body>
            )}
        </Table>
    );
};

const ModelRow = ({ item, current }) => {
    const cells = useMemo(() => {
        let _cells = [...current.fields].filter((f) => f !== 'actions').map((field) => String(item.display(field)));
        _cells.push(<Actions item={item} current={current} />);
        if (current.search) {
            _cells.unshift(<Checkbox size="sm" />);
        }
        return _cells;
    }, [item, current]);

    return (
        <Table.Row>
            {cells.map((cell, index) => (
                <div key={index}>{cell}</div>
            ))}
        </Table.Row>
    );
};
