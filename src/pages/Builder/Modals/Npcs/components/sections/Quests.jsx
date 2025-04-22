import { useTranslation } from '../../../../../../hooks';

import Section from '../Section';

// eslint-disable-next-line
const Quests = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    return <Section label={t('builder.modals.npc.quests')} disabled></Section>;
};

export default Quests;
