import React from 'react';
import { useParams } from 'react-router-dom';
import { useDynamicForm, useDashboardContext } from '../../../hooks';

import { ActionsButtons } from '../components';

import css from './model.module.css';

export const Form = ({ current }) => {
    const params = useParams();
    const [context] = useDashboardContext();
    const { actions } = current; // eslint-disable-line

    const [form, setForm] = useDynamicForm(context.model.find((it) => it.id == params.id)); // eslint-disable-line

    return (
        <>
            <div className={css['dashboard-form-actions']}>
                <ActionsButtons />
            </div>
            {form.id}
        </>
    );
};
