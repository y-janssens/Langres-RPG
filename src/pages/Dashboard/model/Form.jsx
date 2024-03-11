import React from 'react';
import { useParams } from 'react-router-dom';
import { useDynamicForm, useDashboardContext } from '../../../hooks';

export const Form = ({ current }) => {
    const params = useParams();
    const [context] = useDashboardContext();
    const { actions } = current; // eslint-disable-line

    const [form, setForm] = useDynamicForm(context.model.find((it) => it.id == params.id)); // eslint-disable-line

    return <div>{form.id}</div>;
};
