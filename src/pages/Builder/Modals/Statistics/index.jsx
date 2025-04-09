import React, { useState } from 'react';
import { useTranslation } from 'react-i18next';

import { isObject } from 'lodash';
import { Button } from 'react-daisyui';

import { WorldStatistics } from '../../../../models';

import { Loading } from '../../../../components';
import { BuilderModalWrapper } from '../Wrapper';

import css from './statistics.module.css';

const Statistics = ({ type, value, onClose }) => {
    const [stats, loadingStats] = WorldStatistics.useCommand(
        {
            payload: {
                map: value
            }
        },
        [value]
    );

    return (
        <BuilderModalWrapper onClose={onClose} canBeClosed type={type} displaySubtitle={false} displayFooter={false}>
            <div className={css['map-statistics-content']}>
                <Loading loading={!stats || loadingStats}>
                    <Summary stats={stats?.summary} />
                    <Distribution stats={stats?.distribution} />
                    <Details stats={stats?.details} />
                </Loading>
            </div>
        </BuilderModalWrapper>
    );
};

const Details = ({ stats }) => {
    const { t } = useTranslation();
    const [toggle, setToggle] = useState({ Inconsistent: true, Invalid: true, Unchanged: true });

    const handleToggle = (key) => {
        setToggle((prev) => ({ ...prev, [key]: !prev[key] }));
    };
    return (
        <StatisticsBlock title={t('builder.modals.statistics.groups.details')}>
            {Object.entries(stats)?.map(([key, value]) => {
                return (
                    <div className={css['map-statistics-details']} key={key}>
                        <span>
                            <span className={css['map-statistics-toggle']} onClick={() => handleToggle(key)}>{`${t(`builder.modals.statistics.keys.${key}`)}:`}</span>
                            <span>{`${toggle[key] ? JSON.stringify(value, null, 4) : value.length}`}</span>
                        </span>
                    </div>
                );
            })}
        </StatisticsBlock>
    );
};

const Distribution = ({ stats }) => {
    const { t } = useTranslation();
    return (
        <StatisticsBlock title={t('builder.modals.statistics.groups.distribution')}>
            {Object.entries(stats)?.map(([key, value]) => (
                <div className={css['map-statistics-details']} key={key}>
                    <span>
                        <span className={css['map-statistics-key']}>{`${t(`builder.modals.statistics.${key}`)}:`}</span>
                        {isObject(value)
                            ? Object.entries(value).map(([k, v]) => <div className={css['map-statistics-value']} key={k}>{`${k}: ${v}`}</div>)
                            : `${JSON.stringify(value, null, 4).replaceAll('"', '')}`}
                    </span>
                </div>
            ))}
        </StatisticsBlock>
    );
};

const Summary = ({ stats }) => {
    const { t } = useTranslation();
    return (
        <StatisticsBlock title={t('builder.modals.statistics.groups.summary')}>
            {Object.entries(stats)?.map(([key, value]) => {
                return (
                    <div className={css['map-statistics-details']} key={key}>
                        <span className={css['map-statistics-key']}>{`${t(`builder.modals.statistics.keys.${key}`)}:`}</span>
                        <span>{JSON.stringify(value, null, 4)}</span>
                    </div>
                );
            })}
        </StatisticsBlock>
    );
};

export const StatisticsBlock = ({ title = '', children }) => {
    const [toggle, setToggle] = useState(true);

    return (
        <div className={css['map-statistics-block']}>
            <Button dataTheme="business" size="sm" color="primary" onClick={() => setToggle(!toggle)} fullWidth>
                {title}
            </Button>
            {toggle && <div className={css['map-statistics-block-content']}>{children}</div>}
        </div>
    );
};

export default Statistics;
