import React, { Suspense, useCallback, useState } from 'react';
import { Npc as NpcModel } from '../../../../models';
import { useDynamicForm, useGameContext, useTranslation } from '../../../../hooks';

import { BuilderModalWrapper } from '../Wrapper';
import { Loading } from '../../../../components';

import css from './components/npcs.module.css';

const sections = [
    { Component: React.lazy(() => import('./components/sections/Statistics')) },
    { Component: React.lazy(() => import('./components/sections/Parameters')) },
    { Component: React.lazy(() => import('./components/sections/Inventory')) },
    { Component: React.lazy(() => import('./components/sections/Dialogs')) },
    { Component: React.lazy(() => import('./components/sections/Quests')) }
];

const Npc = ({ form, type, value, sync, onClose }) => {
    const { t } = useTranslation();
    const [{ applicationData: settings }] = useGameContext();
    const [existing] = useState(() => form.selectedMap.npcs.some((npc) => npc.starting_point.id === value.id));
    const [id] = useState(() => (existing ? form.selectedMap.npcs.find((npc) => npc.starting_point.id === value.id)?.id : null));
    const [activeSection, setActiveSection] = useState(1);

    const [npcForm, setNpcForm, setNpcFormObject] = useDynamicForm({});

    const [, loadingNpc, syncNpc] = NpcModel.useCommand({
        id,
        payload: {
            mapId: form.selectedMap.id,
            position: [value.x, value.y, value.id]
        },
        onSuccess: (response) => {
            setNpcFormObject({ ...npcForm, ...response });
        }
    });

    const handleSave = useCallback(async () => {
        let npc = new NpcModel({ ...npcForm });
        await npc.save().then(() => {
            sync();
        });
    }, [npcForm, sync]);

    const handleDelete = useCallback(async () => {
        if (!existing) return;
        const npc = new NpcModel({ ...npcForm });
        await npc.delete().then(() => {
            sync();
        });
    }, [npcForm, sync, existing]);

    return (
        <BuilderModalWrapper
            onClose={onClose}
            canBeClosed
            type={type}
            onSave={handleSave}
            displaySubtitle={false}
            customFooter={[
                { id: 'delete', label: t('common.actions.delete'), onClick: () => handleDelete(), disabled: !existing },
                { id: 'reset', label: t('common.actions.reset'), onClick: () => syncNpc() }
            ]}
        >
            <Loading loading={loadingNpc || !Object.keys(npcForm).length}>
                <div className={css['npc-modal-container']}>
                    <Suspense>
                        {sections.map(({ Component }, index) => (
                            <Component
                                key={index}
                                index={index}
                                npcForm={npcForm}
                                settings={settings}
                                setNpcForm={setNpcForm}
                                active={activeSection === index}
                                handleToggle={() => setActiveSection((prev) => (prev === index ? null : index))}
                            />
                        ))}
                    </Suspense>
                </div>
            </Loading>
        </BuilderModalWrapper>
    );
};

export default Npc;
