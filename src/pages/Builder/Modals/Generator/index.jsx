import React, { useState, useCallback, useMemo } from 'react';
import { useMapBatch, useTranslation } from '../../../../hooks';
import { Collection, GeneratorOptions } from '../../../../models';

import { Icon } from '../../../../components';
import { PreviewBlock, EmptyBlock, MapThumbnail } from './Blocks';
import { ButtonIcon, ButtonLabel } from '../../components';
import { GeneratorSettings } from './Settings';
import { BuilderModalWrapper } from '../Wrapper';

import css from './generator.module.css';

const Generator = ({ type, form, setForm, setFormObject, onClose }) => {
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

    const [maps, progress, loadingMaps, sync, cancel] = useMapBatch({
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

    const handleApply = useCallback(() => {
        let act = { ...form.storyLine.acts.find((act) => act.id === form.selectedAct.id) };
        let mapIndex = act.maps.findIndex((mp) => mp.name === form.selectedMap.name);
        let newMap = { ...act.maps[mapIndex] };

        newMap = selectedMap.map;
        act.maps[mapIndex] = newMap;
        setFormObject({ ...form, selectedMap: newMap });
        onClose();
    }, [form, selectedMap, onClose]);

    const handleLaunch = useCallback(() => {
        setReady(true);
        setSelectedMap({ id: null, map: null });
        setSelectedPreview(null);
        setDisplaySettings(false);
        sync();
    }, [sync]);

    const handleReset = useCallback(() => {
        sync();
        setBatchSettings({ ...generatorOptions.defaultOptions });
        setDisplaySettings(true);
    }, [generatorOptions, sync]);

    const handleCancel = useCallback(() => {
        cancel();
        setReady(false);
    }, [cancel]);

    const handleSave = useCallback(async () => {
        let collection = await Collection.new();
        collection.map = selectedMap.map;
        collection.save().then(() => {
            onClose();
        });
    }, [selectedMap, onClose]);

    const loading = useMemo(() => {
        return loadingMaps && progress < batchSettings.options?.amount;
    }, [loadingMaps, progress, batchSettings]);

    if (loadingGeneratorOptions) {
        return null;
    }

    return (
        <BuilderModalWrapper
            subtitle={
                <GeneratorActions
                    options={generatorOptions}
                    settings={batchSettings}
                    displaySettings={displaySettings}
                    setDisplaySettings={setDisplaySettings}
                    disabled={loadingMaps || Boolean(selectedPreview)}
                    progress={progress}
                    loading={loading}
                    handleCancel={handleCancel}
                    maps={maps}
                    handleReset={handleReset}
                    handleSelect={handleSelect}
                    onLaunch={handleLaunch}
                />
            }
            disabled={!selectedMap.id || Boolean(selectedPreview)}
            onSave={handleApply}
            onClose={onClose}
            type={type}
            ctaLabel={t('common.actions.apply')}
            customFooter={[
                { id: 'manage', label: t('builder.collections'), onClick: () => setForm('modal', { type: 'collections', open: true, value: null }) },
                { id: 'save', label: t('common.actions.save'), disabled: !selectedMap.map, onClick: handleSave }
            ]}
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
                {loading && <EmptyBlock index={progress + 1} />}
            </div>
        </BuilderModalWrapper>
    );
};

const GeneratorActions = ({
    settings,
    options,
    disabled,
    progress,
    loading,
    maps,
    displaySettings,
    setDisplaySettings,
    handleCancel = () => {},
    handleReset = () => {},
    onLaunch = () => {},
    handleSelect = () => {}
}) => {
    const { t } = useTranslation();

    return (
        <>
            <div className={css['map-preview-cta']}>
                <span>{`${t('builder.modals.generator.subtitle')}: ${progress}/${settings.options?.amount}`}</span>
                <div className={css['map-preview-cta-btns']}>
                    <ButtonLabel color="primary" label={t('builder.modals.generator.settings')} onClick={() => setDisplaySettings((prev) => !prev)} disabled={loading} />

                    <ButtonIcon icon={<Icon name="reload" />} disabled={!maps?.length || loading} onClick={handleReset} />
                    <ButtonIcon icon={<Icon name="stop" />} disabled={!disabled} onClick={handleCancel} />
                    <ButtonIcon icon={<Icon name="play" />} disabled={disabled} onClick={onLaunch} />
                </div>
            </div>
            <GeneratorSettings settings={settings} options={options} handleSelect={handleSelect} display={displaySettings && !loading} />
        </>
    );
};

export default Generator;
