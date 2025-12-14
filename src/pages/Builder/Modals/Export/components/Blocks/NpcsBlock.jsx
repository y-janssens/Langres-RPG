import i18next from 'i18next';
import { useTranslation } from 'react-i18next';

import { Toggle } from '../../../../components';
import { ExportBlock, ExportSubBlock, SelectToggle } from '../ExportBlock';

import css from '../../export.module.css';

const NpcsBlock = ({ formKey, form, setForm, handleSelect }) => {
    const { t } = useTranslation();
    return (
        <ExportBlock label={t(`builder.modals.export.blocks.npcs_label`)} text={t(`builder.modals.export.blocks.npcs`)} form={form} setForm={setForm} formKey={formKey}>
            {form.maps
                ?.filter((mp) => mp.npcs.length)
                .map((map) => (
                    <ExportSubBlock key={map.id} label={`${map.act_name} - ${map.name}`} form={form} setForm={setForm}>
                        <SelectToggle items={map.npcs.map((npc) => npc.id)} lookup="selectedNpcs" form={form} setForm={setForm} />
                        {map.npcs.map((npc) => (
                            <NpcBlock key={npc.id} npc={npc} form={form} handleSelect={handleSelect} />
                        ))}
                    </ExportSubBlock>
                ))}
        </ExportBlock>
    );
};

const NpcBlock = ({ npc, form, handleSelect }) => {
    const { t } = useTranslation();
    const { language } = i18next;
    const { id, x, y } = npc.starting_point;
    const name = npc.first_name && npc.last_name ? `${npc.title[language]} - ${npc.first_name} ${npc.last_name}` : npc.class;

    return (
        <Toggle
            title={
                <span className={css['export-toggle-label']}>
                    <p>{name}</p>
                    <span>{`${t('npcs.start')} - Id: ${id} x: ${x} y: ${y}`}</span>
                </span>
            }
            active={form.selectedNpcs?.includes(npc.id)}
            onChange={() => handleSelect('selectedNpcs', npc.id)}
        />
    );
};

export default NpcsBlock;
