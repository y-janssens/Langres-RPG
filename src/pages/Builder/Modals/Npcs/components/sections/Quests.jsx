import { useCallback, useMemo } from 'react';
import i18next from 'i18next';

import { Quest } from '../../../../../../models';
import { useTranslation } from '../../../../../../hooks';

import Section from '../Section';
import { ButtonLabel, Select } from '../../../../components';
import { Icon } from '../../../../../../components';

import css from '../npcs.module.css';

const Quests = ({ index, active, handleToggle, npcForm, setNpcForm }) => {
    const { language } = i18next;
    const { t } = useTranslation();

    const [quests, loadingQuests] = Quest.useCommand();

    const options = useMemo(() => {
        if (!quests?.length || loadingQuests) {
            return [];
        }
        return quests
            .filter((qs) => !npcForm.quests.some((q) => q.id === qs.id))
            .reduce(
                (acc, it) => {
                    const item = {
                        key: it.id,
                        text: `${it.id} - ${it.name[language]}`,
                        value: { ...it }
                    };
                    if (it.primary) {
                        acc['primary'].push(item);
                    } else {
                        acc['secondary'].push(item);
                    }
                    return acc;
                },
                { primary: [], secondary: [] }
            );
    }, [npcForm, quests, loadingQuests, language]);

    const handleSelect = useCallback(
        (value) => {
            if (npcForm.quests.some((qs) => qs.id === value.id)) {
                return;
            }
            return setNpcForm('quests', [...npcForm.quests, value]);
        },
        [npcForm]
    );

    const handleDelete = useCallback(
        (id) => {
            const quests = npcForm.quests.filter((qs) => qs.id !== id);
            setNpcForm('quests', quests);
        },
        [npcForm]
    );

    return (
        <Section index={index} active={active} onToggle={() => handleToggle(index)} label={t('builder.modals.npc.quests.label')} disabled={!npcForm.unique}>
            <div className={css['npc-parameters-block']}>
                <QuestsBlock primary options={options} npcForm={npcForm} language={language} handleSelect={handleSelect} handleDelete={handleDelete} />
                <QuestsBlock options={options} npcForm={npcForm} language={language} handleSelect={handleSelect} handleDelete={handleDelete} />
            </div>
        </Section>
    );
};

const QuestsBlock = ({ npcForm, language, options, primary = false, handleSelect, handleDelete }) => {
    const { t } = useTranslation();

    const type = primary ? 'primary' : 'secondary';

    const quests = useMemo(() => {
        return npcForm.quests.filter((qst) => qst['primary'] === primary);
    }, [npcForm.quests, primary]);

    return (
        <>
            <p>{t(`builder.modals.npc.quests.${type}`)}</p>
            <Select
                value={quests?.length > 0 ? `${quests.length} ${t('builder.modals.npc.quests.selected')}` : null}
                placeholder={t('builder.modals.npc.quests.placeholder')}
                options={options[type]}
                onSelect={(value) => handleSelect(value)}
            />
            <div>
                {quests.map((quest) => (
                    <div className={css['npc-selected-item']} key={quest.id}>
                        <ButtonLabel
                            size="sm"
                            fullWidth
                            variant="outline"
                            animation={false}
                            label={
                                <div className={css['npc-quest-label']}>
                                    <span>{`${quest.id} - ${quest.name[language]}`}</span>
                                    <Icon name="erase" onClick={() => handleDelete(quest.id)} />
                                </div>
                            }
                        />
                    </div>
                ))}
            </div>
        </>
    );
};

export default Quests;
