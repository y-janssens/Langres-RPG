import { useTranslation } from 'react-i18next';

import { ExportBlock } from '../ExportBlock';

const StoryBlock = ({ formKey, form, setForm }) => {
    const { t } = useTranslation();

    return (
        <ExportBlock label={t(`builder.modals.export.blocks.storyline_label`)} text={t(`builder.modals.export.blocks.storyline`)} form={form} setForm={setForm} formKey={formKey} />
    );
};

export default StoryBlock;
