import React, { useCallback, useState } from 'react';
import { Npc as NpcModel } from '../../../../models';
import { useDynamicForm, useTranslation } from '../../../../hooks';

import { BuilderModalWrapper } from '../Wrapper';
import { Loading } from '../../../../components';
import { Base, Dialogs, Inventory, Parameters, Quests, Statistics } from './components';

import css from './components/npcs.module.css';

const Npc = ({ form, type, value, sync, onClose }) => {
    const { t } = useTranslation();
    const [existing] = useState(() => form.selectedMap.npcs.some((npc) => npc.starting_point.id === value.id));
    const [id] = useState(() => (existing ? form.selectedMap.npcs.find((npc) => npc.starting_point.id === value.id)?.id : null));

    const [npcForm, setNpcForm, setNpcFormObject] = useDynamicForm({});

    const [, loadingNpc, syncNpc] = NpcModel.useCommand({
        id,
        payload: {
            mapId: form.selectedMap.id,
            position: [value.x, value.y, value.id]
        },
        onSuccess: (response) => {
            setNpcFormObject(response);
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
                    <Base npcForm={npcForm} setNpcForm={setNpcForm} />
                    <Statistics npcForm={npcForm} setNpcForm={setNpcForm} />
                    <Parameters npcForm={npcForm} setNpcForm={setNpcForm} />
                    <Inventory npcForm={npcForm} setNpcForm={setNpcForm} />
                    <Dialogs npcForm={npcForm} setNpcForm={setNpcForm} />
                    <Quests npcForm={npcForm} setNpcForm={setNpcForm} />
                </div>
            </Loading>
        </BuilderModalWrapper>
    );
};

export default Npc;
