import { useCallback, useEffect, useMemo } from 'react';

import { Storyline } from '../../../../models';
import { listSelection } from '../../../../utils';
import { useDynamicForm, useTranslation, useDownload, useClipBoard, ExportFormatter } from '../../../../hooks';

import { BuilderModalWrapper } from '../Wrapper';
import { StoryBlock, MapsBlock, NpcsBlock } from './components/Blocks';

import css from './export.module.css';

const Export = ({ type, storyline, onClose }) => {
    const { t } = useTranslation();

    const [form, setForm, setFormObject] = useDynamicForm({
        maps: [],
        npcs: [],
        storyline: {},
        selectedMaps: [],
        selectedNpcs: [],
        exportStory: null,
        exportMaps: null,
        exportNpcs: null
    });

    const formatter = useMemo(() => new ExportFormatter(form), [form]);
    const disabledSubmit = useMemo(() => !form.exportStory && !form.exportMaps && !form.exportNpcs, [form]);
    const disabledCopy = useMemo(() => !formatter.extractionKeys.length || formatter.extractionKeys?.length > 1, [form]);

    const handleSelect = useCallback((key, id) => setForm(key, listSelection(form[key], id)), [form]);

    const handleSave = useCallback(
        async (mode = 'export') => {
            const values = formatter.format();

            values.forEach(async ({ datas, extension, name }) => {
                switch (mode) {
                    case 'copy':
                        await useClipBoard({ datas, extension });
                        break;
                    case 'export':
                    default:
                        await useDownload({ datas, extension, name });
                        break;
                }
            });
        },
        [formatter]
    );

    const setInitialFormDatas = useCallback(() => {
        let story = new Storyline({ ...storyline });
        story.clean();

        const maps = story?.maps;
        const npcs = story?.npcs;

        setFormObject({ ...form, storyline: story, maps, npcs, selectedMaps: maps?.map((mp) => mp.id), selectedNpcs: npcs?.map((npc) => npc.id) });
    }, [form, storyline]);

    useEffect(() => {
        if (!storyline || !Object.keys(storyline).length) return;
        setInitialFormDatas();
        return () => {};
    }, [storyline]);

    return (
        <BuilderModalWrapper
            type={type}
            canBeClosed
            onClose={onClose}
            onSave={handleSave}
            disabled={disabledSubmit}
            ctaLabel={t('common.actions.export')}
            customFooter={[
                { id: 'cancel', label: t('common.actions.cancel'), onClick: onClose },
                { id: 'copy', label: t('common.actions.copy'), onClick: () => handleSave('copy'), disabled: disabledCopy }
            ]}
        >
            <div className={css['export-modal-container']}>
                <StoryBlock formKey="exportStory" form={form} setForm={setForm} />
                <MapsBlock formKey="exportMaps" form={form} setForm={setForm} handleSelect={handleSelect} />
                <NpcsBlock formKey="exportNpcs" form={form} setForm={setForm} handleSelect={handleSelect} />
            </div>
        </BuilderModalWrapper>
    );
};

export default Export;
