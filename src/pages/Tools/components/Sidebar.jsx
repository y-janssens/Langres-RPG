import { useMemo } from 'react';
import { useTranslation } from 'react-i18next';

import { AdminLogo } from '../../../components';
import Information from './Information';
import { Button } from 'react-daisyui';

import css from './ui.module.css';

const Sidebar = ({ form, handleFunction }) => {
    const { t } = useTranslation();

    const informations = useMemo(() => {
        if (!form.map) {
            return null;
        }
        const { start, end, obstacles, borderCount } = form;

        return {
            start: start && `id: ${start.id}, x: ${start.x}, y: ${start.y}`,
            end: end && `id: ${end.id}, x: ${end.x}, y: ${end.y}`,
            obstacles: obstacles.length - borderCount
        };
    }, [form]);

    return (
        <div className={css['tools-sidebar']}>
            <div className={css['tools-sidebar-logo']}>
                <a href="https://www.marbrume.com/admin/game/" target="_blank" rel="noreferrer">
                    <img src={AdminLogo} alt="logo" />
                </a>
                <div className={css['tools-sidebar-title']}>{t('common.game')}</div>
            </div>
            <div className={css['tools-sidebar-block']}>
                <div className={css['tools-sidebar-items']}>
                    <div className={css['tools-infos-title']}>{t('common.informations')}</div>

                    <Information label={t('tools.sidebar.start')} text={informations.start} />
                    <Information label={t('tools.sidebar.end')} text={informations.end} />
                    <Information label={t('tools.sidebar.obstacles')} text={informations.obstacles} />

                    {!!Object.keys(form.output).length && (
                        <>
                            <div className={css['tools-infos-title']}>{t('common.result')}</div>
                            <Information label={t('tools.sidebar.algorithm')} text={form.algorithm} />
                            <Information label={t('tools.sidebar.operations')} text={form.output.operations} />
                            <Information label={t('tools.sidebar.time')} text={`${form.output.time}s`} />
                        </>
                    )}
                </div>
                <div className={css['tools-sidebar-actions']}>
                    <SideBarItem label={t('tools.actions.path')} disabled={!form.start || !form.end} primary onClick={() => handleFunction('start')} />
                    <SideBarItem label={t('tools.actions.cull')} disabled={!form.start} primary onClick={() => handleFunction('cull')} />
                    <SideBarItem label={t('tools.actions.randomize')} onClick={() => handleFunction('randomize')} />
                    <SideBarItem label={t('common.actions.reset')} inverted onClick={() => handleFunction('reset')} />
                </div>
            </div>
        </div>
    );
};

const SideBarItem = ({ label, primary = false, inverted = false, disabled = false, onClick }) => {
    return (
        <div className={css['tools-sidebar-item']}>
            <Button
                className={css[`tools-sidebar-item-${primary ? 'active' : 'idle'}`]}
                dataTheme="forest"
                size="sm"
                color={inverted ? 'ghost' : primary ? 'primary' : 'accent'}
                variant={inverted && 'outline'}
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
