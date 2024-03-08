import React, { useMemo } from 'react';
import { useNavigate } from 'react-router-dom';

import { useGet, useTranslation } from '../../../hooks';
import { AdminModel } from '../../../models';

import { Table, Checkbox } from 'react-daisyui';

import css from '../dashboard.module.css';

export const Model = ({ current, model, setModel }) => {
    const { t } = useTranslation();

    useGet(
        {
            func: current.command,
            useLoader: false,
            onSuccess: (response) => {
                setModel(AdminModel.fromAPI(response, current.model));
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

    return (
        <div className={css['model-block']}>
            <Table dataTheme="dark" zebra size="lg">
                <Table.Head>
                    {fields?.map((field, index) => {
                        return <span key={index}>{field && t(`dashboard.table.${current.name}.${field}`)}</span>;
                    })}
                </Table.Head>

                {model?.length > 0 && (
                    <Table.Body>
                        {model.map((item, index) => (
                            <ModelRow key={index} item={item} current={current} />
                        ))}
                    </Table.Body>
                )}
            </Table>
        </div>
    );
};

const ModelRow = ({ item, current }) => {
    const navigate = useNavigate();
    const cells = useMemo(() => {
        let _cells = [...current.fields].filter((f) => f !== 'actions').map((field) => String(item.display(field)));
        _cells.push('TEST');
        if (current.search) {
            _cells.unshift(<Checkbox size="sm" />);
        }
        return _cells;
    }, [item, current]);

    return (
        <Table.Row onClick={() => navigate(`/admin/dashboard/${current.name}/${item.id}`)}>
            {cells.map((cell, index) => (
                <div key={index}>{cell}</div>
            ))}
        </Table.Row>
    );
};
