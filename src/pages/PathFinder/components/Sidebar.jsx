import { useMemo } from 'react';
import { useTranslation } from 'react-i18next';

import { AdminLogo } from '../../../components/images';
import { Button } from 'react-daisyui';

import css from './ui.module.css';

const Sidebar = ({ form, handleReset, handleStart, handleRandomize }) => {
    const { t } = useTranslation();

    const informations = useMemo(() => {
        if (!form.map) {
            return null;
        }
        const { start, end, obstacles } = form;

        return {
            start: start && `id: ${start.id}, x: ${start.x}, y: ${start.y}`,
            end: end && `id: ${end.id}, x: ${end.x}, y: ${end.y}`,
            obstacles: obstacles.length
        };
    }, [form]);

    return (
        <div className={css['pathfinder-sidebar']}>
            <div className={css['pathfinder-sidebar-logo']}>
                <a href="https://www.marbrume.com/admin/game/" target="_blank" rel="noreferrer">
                    <img src={AdminLogo} alt="logo" />
                </a>
                <div className={css['pathfinder-sidebar-title']}>{t('common.game')}</div>
            </div>
            <div className={css['pathfinder-sidebar-block']}>
                <div className={css['pathfinder-sidebar-items']}>
                    <div className={css['pathfinder-infos-title']}>{t('common.informations')}</div>
                    <p>Start: {informations?.start}</p>
                    <p>End: {informations?.end}</p>
                    <p>Obstacles: {informations?.obstacles}</p>

                    {!!Object.keys(form.output).length && (
                        <>
                            <div className={css['pathfinder-infos-title']}>{t('common.result')}</div>
                            <p>Algorithm: {form.algorithm}</p>
                            <p>Operations: {form.output.operations}</p>
                            <p>Time elapsed: {form.output.time}</p>
                        </>
                    )}
                </div>
                <div className={css['pathfinder-sidebar-actions']}>
                    <SideBarItem label={t('common.actions.start')} disabled={!form.start || !form.end} primary onClick={handleStart} />
                    <SideBarItem label={'Randomize'} primary onClick={handleRandomize} />
                    <SideBarItem label={t('common.actions.reset')} onClick={handleReset} />
                </div>
            </div>
        </div>
    );
};

const SideBarItem = ({ label, primary = false, disabled = false, onClick }) => {
    return (
        <div className={css['pathfinder-sidebar-item']}>
            <Button
                className={css[`pathfinder-sidebar-item-${primary ? 'active' : 'idle'}`]}
                dataTheme="forest"
                size="sm"
                color={primary ? 'primary' : 'accent'}
                fullWidth
                onClick={onClick}
                disabled={disabled}
            >
                {label}
            </Button>
        </div>
    );
};

export default Sidebar;
