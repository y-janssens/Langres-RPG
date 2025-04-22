import { useTranslation } from '../../../../../../hooks';

import { Select, Toggle } from '../../../../components';
import { Input } from 'react-daisyui';
import Section from '../Section';

import css from '../npcs.module.css';

const Parameters = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    const classOptions = [
        { key: 0, text: t('npcs.zombie'), value: 'Zombie' },
        { key: 1, text: t('npcs.bandit'), value: 'Bandit' },
        { key: 2, text: t('npcs.soldier'), value: 'Soldier' }
    ];

    return (
        <Section label={t('builder.modals.npc.parameters')}>
            <div className={css['npc-parameters-block']}>
                {npcForm.unique && (
                    <>
                        <p>{t('common.character.first_name')}</p>
                        <Input size="sm" color="neutral" dataTheme="dark" value={npcForm.first_name} onChange={({ target: { value } }) => setNpcForm('first_name', value)} />
                        <p>{t('common.character.last_name')}</p>
                        <Input size="sm" color="neutral" dataTheme="dark" value={npcForm.last_name} onChange={({ target: { value } }) => setNpcForm('last_name', value)} />
                    </>
                )}

                <p>{t('common.character.class')}</p>
                <Select label={npcForm.class} options={classOptions} onSelect={(value) => setNpcForm('class', value)} />

                <Toggle title={t('common.character.static')} active={npcForm.static} onChange={({ target: { checked } }) => setNpcForm('static', checked)} />
                <Toggle title={t('common.character.is_alive')} active={npcForm.is_alive} onChange={({ target: { checked } }) => setNpcForm('is_alive', checked)} />
                <Toggle title={t('common.character.hostile')} active={npcForm.hostile} onChange={({ target: { checked } }) => setNpcForm('hostile', checked)} />
                <Toggle
                    title={t('common.character.can_be_hostile')}
                    active={npcForm.can_be_hostile}
                    onChange={({ target: { checked } }) => setNpcForm('can_be_hostile', checked)}
                    disabled={npcForm.hostile}
                />
            </div>
        </Section>
    );
};

export default Parameters;
