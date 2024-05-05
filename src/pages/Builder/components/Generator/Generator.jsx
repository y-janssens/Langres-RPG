import React, { useState, useCallback, useMemo } from 'react';
import { useMapBatch, useTranslation } from '../../../../hooks';
import { GeneratorOptions } from '../../../../models';

import { Modal } from '../Modal/Modal';
import Icon from '../../../../components/ui/Icon';
import { PreviewBlock, EmptyBlock, MapThumbnail } from './Blocks';
import { ButtonIcon, ButtonLabel } from '../ButtonLabel';
import { GeneratorSettings } from './Settings';

import css from './generator.module.css';

export const Generator = ({ open, form, setFormObject, onClose }) => {
    const { t } = useTranslation();
    const [ready, setReady] = useState(false);
    const [batchSettings, setBatchSettings] = useState({});
    const [displaySettings, setDisplaySettings] = useState(true);
    const [selectedMap, setSelectedMap] = useState({ id: null, map: null });
    const [selectedPreview, setSelectedPreview] = useState(null);

    const [generatorOptions, loadingGeneratorOptions] = GeneratorOptions.useCommand({
        onSuccess: (response) => {
            setBatchSettings(response.defaultOptions);
        }
    });

    const [maps, progress, loadingMaps, regenerate, clear] = useMapBatch({
        map: form.selectedMap,
        options: { ...batchSettings }.options,
        amount: { ...batchSettings }.options?.amount,
        launch: ready,
        onSuccess: () => {
            setReady(false);
        }
    });

    const handleSelect = useCallback(
        (type, value) => {
            let settings = { ...batchSettings };
            settings.options[type] = value;
            setBatchSettings(settings);
        },
        [batchSettings, generatorOptions]
    );

    const handleSave = useCallback(() => {
        let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.content.maps[mapIndex] };

        newMap = selectedMap.map;
        act.content.maps[mapIndex] = newMap;
        setFormObject({ ...form, selectedMap: newMap });
        onClose();
    }, [form, selectedMap, onClose]);

    const handleLaunch = useCallback(() => {
        setReady(true);
        setSelectedMap({ id: null, map: null });
        setSelectedPreview(null);
        setDisplaySettings(false);
        regenerate();
    }, [regenerate]);

    const handleReset = useCallback(() => {
        clear();
        setBatchSettings({ ...generatorOptions.defaultOptions });
    }, [generatorOptions, clear]);

    const loading = useMemo(() => {
        return loadingMaps && progress < batchSettings.options?.amount;
    }, [loadingMaps, progress, batchSettings]);

    if (!open || loadingGeneratorOptions) {
        return null;
    }

    return (
        <Modal
            title={t('builder.modals.generator.title')}
            subtitle={
                <GeneratorActions
                    options={generatorOptions}
                    settings={batchSettings}
                    displaySettings={displaySettings}
                    setDisplaySettings={setDisplaySettings}
                    disabled={loadingMaps || selectedPreview}
                    progress={progress}
                    loading={loading}
                    handleReset={handleReset}
                    handleSelect={handleSelect}
                    onLaunch={handleLaunch}
                />
            }
            disabled={!selectedMap.id || selectedPreview}
            onSave={handleSave}
            onClose={onClose}
            canBeClosed
        >
            {maps.length > 0 && selectedPreview && !loadingMaps && (
                <div className={css['map-selected-preview']} onClick={() => setSelectedPreview(null)}>
                    <MapThumbnail map={maps[selectedPreview - 1].content} size={3} />
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

const GeneratorActions = ({
    settings,
    options,
    disabled,
    progress,
    loading,
    displaySettings,
    setDisplaySettings,
    handleReset = () => {},
    onLaunch = () => {},
    handleSelect = () => {}
}) => {
    const { t } = useTranslation();

    const handleClear = useCallback(() => {
        setDisplaySettings(!displaySettings);
    }, [displaySettings]);

    return (
        <>
            <div className={css['map-preview-cta']}>
                <span>{`${t('builder.modals.generator.subtitle')}: ${progress}/${settings.options?.amount}`}</span>
                <div className={css['map-preview-cta-btns']}>
                    <ButtonLabel color="primary" label={t('builder.modals.generator.settings')} onClick={handleClear} disabled={loading} />
                    <ButtonLabel variant="outline" label={t('builder.modals.generator.reset')} onClick={handleReset} disabled={loading} />

                    <ButtonIcon icon={<Icon name="reload" />} size="sm" disabled={disabled} onClick={() => onLaunch()} />
                </div>
            </div>
            <GeneratorSettings settings={settings} options={options} handleSelect={handleSelect} display={displaySettings && !loading} />
        </>
    );
};
