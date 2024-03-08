import React, { useMemo, memo } from 'react';
import { useNavigate } from 'react-router-dom';
import { useGet, useTranslation } from '../../hooks';
import { AdminModel } from '../../models';

import { Table } from 'react-daisyui';

import css from './dashboard.module.css';

export const Model = ({ current, model, setModel }) => {
    const { t } = useTranslation();

    const [, loadingModel] = useGet(
        {
            func: current.command,
            launch: current,
            onSuccess: (response) => {
                setModel(AdminModel.fromAPI(response, current.model));
            }
        },
        [current]
    );

    if (loadingModel || !model || !current) {
        return null;
    }

    return (
        <div className={css['model-block']}>
            <Table dataTheme="dark" zebra size="lg">
                <Table.Head>
                    {current.fields?.map((field, index) => {
                        return <span key={index}>{t(`dashboard.table.${current.name}.${field}`)}</span>;
                    })}
                </Table.Head>

                {!loadingModel && model?.length > 0 && (
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

const ModelRow = memo(({ item, current }) => {
    const navigate = useNavigate();
    const cells = useMemo(() => {
        let _cells = current.fields.filter((f) => f !== 'actions').map((field) => String(item.display(field)));
        _cells.push('TEST');
        return _cells;
    }, [item, current]);

    return (
        <Table.Row onClick={() => navigate(`/admin/dashboard/${current.name}/${item.id}`)}>
            {cells.map((cell, index) => (
                <span key={index}>{cell}</span>
            ))}
        </Table.Row>
    );
});
