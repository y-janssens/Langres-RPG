import { Npc as NpcModel } from '../../../../../../models';
import { useTranslation } from '../../../../../../hooks';

import { Input } from 'react-daisyui';
import Section from '../Section';

import css from '../npcs.module.css';

const Statistics = ({ npcForm, setNpcForm }) => {
    const { t } = useTranslation();

    return (
        <Section label={t('builder.modals.npc.statistics')}>
            <div className={css['npc-stats-block']}>
                {NpcModel.statsKeys.map((k) => (
                    <Stat key={k} form={npcForm} setForm={setNpcForm} stat={k} />
                ))}
            </div>
        </Section>
    );
};

export default Statistics;

const Stat = ({ form, setForm, stat }) => {
    return (
        <span className={css['npc-stat']}>
            <p>{stat}</p>
            <Input type="number" size="sm" color="neutral" dataTheme="dark" value={form[stat]} onChange={({ target: { value } }) => setForm(stat, Number(value))} />
        </span>
    );
};
