import { useTranslation } from '../../../../../../hooks';

import { Toggle } from '../../../../components';
import Section from '../Section';

import css from '../npcs.module.css';

const Base = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    return (
        <Section label={t('builder.modals.npc.base')}>
            <div className={css['npc-base-block']}>
                <div>
                    <Toggle title={t('common.character.unique')} active={npcForm.unique} onChange={({ target: { checked } }) => setNpcForm('unique', checked)} />
                    <span>{t('common.character.unique_description')}</span>
                </div>
            </div>
        </Section>
    );
};

export default Base;
