import { useTranslation } from '../../../../../../hooks';

import Section from '../Section';

// eslint-disable-next-line
const Inventory = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    return <Section label={t('builder.modals.npc.inventory')} disabled></Section>;
};

export default Inventory;
