import { useTranslation } from '../../../../../../hooks';

import Section from '../Section';

// eslint-disable-next-line
const Dialogs = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    return <Section label={t('builder.modals.npc.dialogs')} disabled></Section>;
};

export default Dialogs;
