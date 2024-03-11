import React, { useState } from 'react';
import { useCommand, useTranslation } from '../../../../hooks';
import useDashboardContext from '../../../../hooks/useDashboardContext';

import { ModalBody } from './ModalBody';

export const Modal = ({ current }) => {
    const { t } = useTranslation();
    const [context, setContext] = useDashboardContext();
    const [instance, setInstance] = useState(null);

    const [, , syncInstance] = useCommand({
        func: new context.instance().new_command,
        onSuccess: (response) => setInstance(new context.instance(response))
    });

    return (
        <ModalBody title={t(`dashboard.modal.${current.name}-title`)} onClose={() => setContext({ instance: null })} onReset={() => syncInstance()} onSave={() => instance.save()}>
            test
        </ModalBody>
    );
};
