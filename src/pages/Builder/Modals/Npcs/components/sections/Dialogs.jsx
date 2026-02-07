import { useCallback, useMemo, useState } from 'react';
import i18next from 'i18next';
import { cloneDeep } from 'lodash';
import { useTranslation } from '../../../../../../hooks';

import { default as Section, SubSection } from '../Section';
import { Icon } from '../../../../../../components';
import { ButtonLabel, Select } from '../../../../components';
import { Textarea } from 'react-daisyui';

import css from '../npcs.module.css';

const defaultQuote = { quote: { fr: null, en: null } };

const Dialogs = ({ index, active, handleToggle, npcForm, setNpcForm, settings }) => {
    const { t } = useTranslation();
    const { languages } = settings;
    const { language } = i18next;

    const [languagesOptions] = useState(() => languages.map((ln) => ({ ...ln, text: ln.value, value: ln.key })));

    const quotes = useMemo(() => {
        if (!npcForm.dialogs?.length) {
            return [];
        }
        const grouped = npcForm.dialogs.reduce((acc, qt) => {
            (acc[qt.order] ??= []).push(qt);
            return acc;
        }, {});
        return Object.entries(grouped);
    }, [npcForm.dialogs]);

    const highestOrder = useMemo(() => {
        if (!npcForm.dialogs?.length) {
            return 0;
        }
        return Math.max(...npcForm.dialogs.map((qt) => qt.order), 0);
    }, [npcForm.dialogs]);

    const handleNew = useCallback(() => {
        const new_quotes = [
            { order: highestOrder + 1, ...cloneDeep(defaultQuote), type: 'Npc' },
            { order: highestOrder + 1, ...cloneDeep(defaultQuote), type: 'Player' }
        ];

        setNpcForm('dialogs', [...npcForm.dialogs, ...new_quotes]);
    }, [npcForm.dialogs, highestOrder]);

    const handleChange = useCallback(
        (order, type, language, value) => {
            const dialogs = [...npcForm.dialogs].map((qt) => {
                if (qt.order === order && qt.type === type) {
                    qt.quote[language] = value ? value : null;
                }
                return qt;
            });
            setNpcForm('dialogs', dialogs);
        },
        [npcForm.dialogs]
    );

    const handleDelete = useCallback(
        (e, order) => {
            e.stopPropagation();
            const dialogs = [...npcForm.dialogs].filter((qt) => qt.order !== order);
            setNpcForm('dialogs', dialogs);
        },
        [npcForm.dialogs]
    );

    const handleSort = useCallback(
        (e, currentOrder, direction) => {
            e.stopPropagation();
            const thresholds = {
                up: Math.max(0, currentOrder - 1),
                down: Math.min(highestOrder, currentOrder + 1)
            };
            const targetOrder = thresholds[direction];

            if (currentOrder === targetOrder) return;

            const updatedDialogs = [...npcForm.dialogs].map((dialog) => {
                if (dialog.order === currentOrder) {
                    return { ...dialog, order: targetOrder };
                } else if (dialog.order === targetOrder) {
                    return { ...dialog, order: currentOrder };
                }
                return dialog;
            });
            setNpcForm('dialogs', updatedDialogs);
        },
        [highestOrder, npcForm.dialogs]
    );

    return (
        <Section index={index} active={active} onToggle={() => handleToggle(index)} label={t('builder.modals.npc.dialogs.label')} disabled={!npcForm.unique}>
            <div className={css['npc-parameters-block']}>
                <p>{t('builder.modals.npc.dialogs.subtitle')}</p>
                {quotes?.map(([order, sequence], index) => (
                    <DialogBlock
                        key={index}
                        quotes={quotes}
                        sequence={sequence}
                        language={language}
                        order={Number(order)}
                        handleSort={handleSort}
                        highestOrder={highestOrder}
                        handleChange={handleChange}
                        handleDelete={handleDelete}
                        languagesOptions={languagesOptions}
                    />
                ))}
                <ButtonLabel
                    className={css['npc-dialogs-cta-label']}
                    variant="outline"
                    size="sm"
                    fullWidth
                    label={
                        <>
                            <Icon name="plus" onClick={handleNew} />
                            {t('builder.modals.npc.dialogs.new_sequence')}
                        </>
                    }
                    onClick={handleNew}
                />
            </div>
        </Section>
    );
};

const DialogBlock = ({ order, sequence, language, languagesOptions, handleChange, handleDelete, handleSort, highestOrder }) => {
    const { t } = useTranslation();
    const [selectedLanguage, setSelectedLanguage] = useState(language);

    return (
        <SubSection
            active={order === 0}
            label={
                <div className={css['npc-dialogs-label']}>
                    <span className={css['npc-dialogs-label-header']}>
                        <div className={css['npc-dialogs-label-id']}>{order}</div>
                        <span>{t('builder.modals.npc.dialogs.sequence')}</span>
                    </span>
                    <span className={css['npc-dialogs-cta']}>
                        {order > 0 && <DialogCta icon="top" onClick={(e) => handleSort(e, order, 'up')} />}
                        {order < highestOrder && <DialogCta icon="bottom" onClick={(e) => handleSort(e, order, 'down')} />}
                        <DialogCta icon="erase" onClick={(e) => handleDelete(e, order)} deleteItem />
                    </span>
                </div>
            }
        >
            <div className={css['npc-dialogs-selector-block']}>
                <div className={css['npc-dialogs-selector']}>
                    <Select options={languagesOptions} value={selectedLanguage} onSelect={setSelectedLanguage} />
                </div>
            </div>

            <div className={css['npc-dialogs-block']}>
                <div className={css['npc-dialogs-item']}>
                    {sequence.map(({ quote, type }, index) => (
                        <div className={css[`npc-dialogs-${type.toLowerCase()}`]} key={index}>
                            <p>{t(`builder.modals.npc.dialogs.${type.toLowerCase()}`)}</p>
                            <Textarea
                                size="sm"
                                color="neutral"
                                dataTheme="dark"
                                value={quote[selectedLanguage] || ''}
                                onChange={({ target: { value } }) => handleChange(order, type, selectedLanguage, value)}
                            />
                        </div>
                    ))}
                </div>
            </div>
        </SubSection>
    );
};

const DialogCta = ({ icon, onClick, deleteItem = false }) => {
    return (
        <div className={css[deleteItem ? 'npc-dialogs-cta-btn-delete' : 'npc-dialogs-cta-btn']}>
            <Icon name={icon} size="small" onClick={onClick} />
        </div>
    );
};

export default Dialogs;
