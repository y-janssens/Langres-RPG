import { useState } from 'react';
import { useTranslation } from 'react-i18next';

import { Toggle } from '../../../../components';
import { ExportBlock, ExportSubBlock, SelectToggle } from '../ExportBlock';

import css from '../../export.module.css';

const MapsBlock = ({ formKey, form, setForm, handleSelect }) => {
    const { t } = useTranslation();

    return (
        <ExportBlock label={t(`builder.modals.export.blocks.maps_label`)} text={t(`builder.modals.export.blocks.maps`)} form={form} setForm={setForm} formKey={formKey}>
            {form.storyline?.acts?.map((act) => (
                <ActBlock key={act.id} act={act} form={form} setForm={setForm} handleSelect={handleSelect} />
            ))}
        </ExportBlock>
    );
};

const ActBlock = ({ act, form, setForm, handleSelect }) => {
    const [mapsIds] = useState(() => act.maps.map((mp) => mp.id));

    return (
        <ExportSubBlock label={`${act.name} - ${act.title}`} form={form} setForm={setForm}>
            <SelectToggle items={mapsIds} lookup="selectedMaps" form={form} setForm={setForm} />
            {act.maps.map((mp) => (
                <Toggle
                    key={mp.id}
                    title={
                        <span className={css['export-toggle-label']}>
                            <p>{mp.name}</p>
                            <span>{`Id: ${mp.id}`}</span>
                        </span>
                    }
                    active={form.selectedMaps?.includes(mp.id)}
                    onChange={() => handleSelect('selectedMaps', mp.id)}
                />
            ))}
        </ExportSubBlock>
    );
};

export default MapsBlock;
