import React, { useState, useCallback, useMemo } from 'react';
import { useMapBatch, useTranslation } from '../../../../hooks';
import { Modal } from '../Modal/Modal';
import Icon from '../../../../components/ui/Icon';
import { PreviewBlock, EmptyBlock, MapThumbnail } from './Blocks';
import { ButtonIcon } from '../ButtonLabel';
import { SelectButton } from '../selector/Selector';
import css from './generator.module.css';

const MAP_TYPES = [
    { label: 'forest', key: 0 },
    { label: 'swamp', key: 1 }
];

const DEFAULT_OPTIONS = {
    options: {
        type: MAP_TYPES[1].label,
        town: false,
        shanty: true
    },
    amount: 25
};

export const Generator = ({ open, form, setFormObject, onClose }) => {
    const { t } = useTranslation();
    const [ready, setReady] = useState(false);
    const [batchSettings, setBatchSettings] = useState(() => ({ ...DEFAULT_OPTIONS }));
    const [selectedMap, setSelectedMap] = useState({ id: null, map: null });
    const [selectedPreview, setSelectedPreview] = useState(null);

    const [maps, progress, loadingMaps, regenerate] = useMapBatch({
        ...batchSettings,
        launch: ready,
        onSuccess: () => {
            setReady(false);
        }
    });

    const handleSelect = useCallback(
        (value) => {
            let settings = { ...batchSettings };
            settings.options.type = value;
            setBatchSettings(settings);
        },
        [batchSettings]
    );

    const handleSave = useCallback(() => {
        let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.content.maps[mapIndex] };

        newMap.content = selectedMap.map;
        act.content.maps[mapIndex] = newMap;
        setFormObject({ ...form, selectedMap: newMap });
        onClose();
    }, [form, selectedMap, onClose]);

    const handleReset = useCallback(() => {
        setReady(true);
        setSelectedMap({ id: null, map: null });
        setSelectedPreview(null);
        regenerate();
    }, [regenerate]);

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
                    total={batchSettings.amount}
                    disabled={loadingMaps || selectedPreview}
                    progress={progress}
                    onLaunch={() => setReady(true)}
                    selected={batchSettings.options.type}
                    handleSelect={handleSelect}
                    sync={handleReset}
                />
            }
            disabled={!selectedMap.id || selectedPreview}
            onSave={handleSave}
            onClose={onClose}
            canBeClosed
        >
            {maps.length > 0 && selectedPreview && !loadingMaps && (
                <div className={css['map-selected-preview']} onClick={() => setSelectedPreview(null)}>
                    <MapThumbnail map={maps[selectedPreview - 1]} size={3} />
                </div>
            )}
            <div className={css[selectedPreview ? 'map-preview-block-inactive' : 'map-preview-block']}>
                {maps.map((mp, i) => (
                    <PreviewBlock key={i} map={mp} index={i + 1} selected={selectedMap} setPreview={setSelectedPreview} setSelect={setSelectedMap} loading={loading} />
                ))}
                {loading && <EmptyBlock index={progress} />}
            </div>
        </Modal>
    );
};

const GeneratorActions = ({ disabled, total, progress, selected, onLaunch = () => {}, sync = () => {}, handleSelect = () => {} }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(false);

    const trigger = useCallback(() => {
        if (progress === 0) {
            return onLaunch();
        }
        return sync();
    }, [progress, sync, onLaunch]);

    return (
        <div className={css['map-preview-cta']}>
            <span>{`${t('builder.modals.generator.subtitle')}: ${progress}/${total}`}</span>
            <div className={css['map-preview-cta-btns']}>
                <SelectButton open={open} label={t(`builder.modals.generator.types.${selected}`) || t('builder.modals.generator.select')} onClick={() => setOpen(!open)} disabled />
                {open && (
                    <div className={css['map-preview-cta-content']}>
                        {MAP_TYPES.map((type) => {
                            return (
                                <span
                                    key={type.key}
                                    className={css['map-preview-cta-content-item']}
                                    onClick={() => {
                                        handleSelect(type.label);
                                        setOpen(false);
                                    }}
                                >
                                    {t(`builder.modals.generator.types.${type.label}`)}
                                </span>
                            );
                        })}
                    </div>
                )}
                <ButtonIcon icon={<Icon name="reload" />} size="sm" disabled={disabled} onClick={() => trigger()} />
            </div>
        </div>
    );
};
