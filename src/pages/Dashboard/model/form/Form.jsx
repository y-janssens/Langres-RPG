import React, { useState, useCallback } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useNew, useDynamicForm, useDashboardContext, useTranslation } from '../../../../hooks';
import { AdminModel } from '../../../../models';

import { InstanceItem } from './FormItems';
import { FormBody } from './FormBody';

export const Form = ({ current }) => {
    const { id } = useParams();
    const { t } = useTranslation();
    const navigate = useNavigate();
    const [context] = useDashboardContext();
    const [instance] = useState(() => AdminModel.getInstance(current.model));

    const [form, setForm] = useDynamicForm(context.model.find((it) => it.id == id));

    const [, , syncInstance] = useNew(
        {
            func: new instance().new_command,
            launch: !id,
            onSuccess: (response) => {
                setForm(new instance(response).instance);
            }
        },
        [id]
    );

    const handleRedirect = useCallback(() => {
        navigate(`/admin/dashboard/${current.name}`);
    }, [current]);

    const handleSave = useCallback(() => {
        new instance(form).save({ override: true }).then(() => {
            handleRedirect();
            syncInstance();
        });
    }, [form, syncInstance, handleRedirect]);

    return (
        <FormBody title={id || `${t(`common.actions.new`)} ${current.name}`} onSave={handleSave} onCancel={handleRedirect} onReset={() => syncInstance()}>
            {form.id &&
                current.fields.map((field, index) => {
                    return <InstanceItem key={index} current={current} field={field.name} value={form[field.name]} onChange={setForm} />;
                })}
        </FormBody>
    );
};
