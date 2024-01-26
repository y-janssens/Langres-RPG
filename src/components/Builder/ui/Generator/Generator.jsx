import React, { useState, useCallback, useMemo } from 'react';
import { useMapBatch } from '../../../../hooks';
import { useTranslation } from 'react-i18next';
import { Modal } from '../Modal/Modal';
import Icon from '../../../ui/Icon';
import { PreviewBlock, EmptyBlock } from './Blocks';
import { ButtonIcon } from '../ButtonLabel';
import css from './generator.module.css';

export const Generator = ({ open, form, setFormObject, onClose }) => {
    const { t } = useTranslation();
    const [ready, setReady] = useState(false);
    const [batchSettings] = useState(() => ({ kind: 'forest', amount: 25 }));
    const [selectedMap, setSelectedMap] = useState({ id: null, map: null });

    const [maps, progress, loadingMaps, regenerate] = useMapBatch({
        ...batchSettings,
        launch: ready,
        onSuccess: () => {
            setReady(false);
        }
    });

    const handleSave = useCallback(() => {
        let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.content.maps[mapIndex] };

        newMap.content = selectedMap.map;
        act.content.maps[mapIndex] = newMap;
        setFormObject({ ...form, selectedMap: newMap });
        onClose();
    }, [form, selectedMap, onClose]);

    const loading = useMemo(() => {
        return loadingMaps && progress < batchSettings.amount;
    }, [loadingMaps, progress, batchSettings]);

    if (!open) {
        return null;
    }

    return (
        <Modal
            title={t('builder.modals.generator.title')}
            subtitle={
                <GeneratorActions
                    settings={batchSettings}
                    loading={loadingMaps}
                    total={batchSettings.amount}
                    progress={progress}
                    onLaunch={() => setReady(true)}
                    sync={() => {
                        setReady(true);
                        regenerate();
                    }}
                />
            }
            disabled={!selectedMap.id}
            onSave={handleSave}
            onClose={onClose}
            canBeClosed
        >
            <div className={css['map-preview-block']}>
                {maps.map((mp, i) => (
                    <PreviewBlock key={i} map={mp} index={i + 1} selected={selectedMap} setSelect={setSelectedMap} />
                ))}
                {loading && <EmptyBlock index={progress} />}
            </div>
        </Modal>
    );
};

const GeneratorActions = ({ loading, total, progress, onLaunch = () => {}, sync = () => {} }) => {
    const { t } = useTranslation();

    const trigger = useCallback(() => {
        if (progress === 0) {
            return onLaunch();
        }
        return sync();
    }, [progress, sync, onLaunch]);

    return (
        <div className={css['map-preview-cta']}>
            <span>{`${t('builder.modals.generator.subtitle')}: ${progress}/${total}`}</span>
            <ButtonIcon icon={<Icon name="reload" />} size="sm" disabled={loading} onClick={() => trigger()} />
        </div>
    );
};
