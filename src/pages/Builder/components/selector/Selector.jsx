import { useCallback, useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Button, Input } from 'react-daisyui';
import css from './selector.module.css';
import { ButtonIcon } from '../ButtonLabel';
import { Icon } from '../../../../components';

export const MultiSelect = ({ datas, label = '', form = {}, setForm = () => {} }) => {
    const { t } = useTranslation();
    const [search, setSearch] = useState('');

    const matchSearch = useCallback((value, search) => {
        const rule = new RegExp(search, 'gi');
        return rule.test(value);
    });

    const groups = useMemo(() => {
        if (!Object.keys(datas).length) {
            return [];
        }
        if (!search || search === '') {
            return datas.story.acts.filter((act) => !act.temp).map((act) => act);
        }
        return datas.story.acts.filter((act) => !act.temp && act.content.maps.filter((mp) => !mp.temp).some((wrl) => matchSearch(wrl.name, search)));
    }, [datas, search, matchSearch]);

    const disabled = useMemo(() => {
        if (!Object.keys(datas).length) {
            return true;
        }
        return datas?.story.acts.every((act) => !act.content.maps.length);
    }, [datas]);

    if (!Object.keys(datas).length) {
        return null;
    }

    return (
        <div className={css['select-multi-container']}>
            <SelectButton
                open={form.displaySelector}
                label={label}
                onClick={() => {
                    setForm('displaySelector', !form.displaySelector);
                    setForm('modal', { type: null, open: false, value: null });
                }}
            />
            {form.displaySelector && datas && (
                <div className={css['select-multi-content']}>
                    <Input
                        className={css['select-multi-searchbar']}
                        dataTheme="dark"
                        size="xs"
                        placeholder={`${t('common.actions.search')}...`}
                        bordered
                        value={search}
                        disabled={disabled}
                        onChange={({ target: { value } }) => setSearch(value)}
                    />
                    {groups
                        .sort((a, b) => a.order - b.order)
                        .map((gr, index) => {
                            return <SelectGroup key={index} group={gr} search={search} onSelect={setForm} onClose={() => setForm('displaySelector', false)} />;
                        })}
                </div>
            )}
        </div>
    );
};

export const SelectButton = ({ label, open = false, onClick = () => {}, size = 'xs' }) => {
    return (
        <div className={css['selector-select-btn']}>
            <Button dataTheme="dark" size={size} color="neutral" active variant="outline" fullWidth onClick={onClick} animation={false}>
                <div className={css['select-multi-label']}>
                    <span>{label}</span>
                    <span className={css['select-multi-chevron']}>{String.fromCharCode(open ? '9650' : '9660')}</span>
                </div>
            </Button>
        </div>
    );
};

export const SelectGroup = ({ group, search, onSelect = () => {}, onClose = () => {} }) => {
    const [open, setOpen] = useState(false);

    const handleSelect = useCallback(
        (item) => {
            onSelect('selectedMap', item);
            onSelect('selectedAct', group);
            onClose();
        },
        [onSelect, onClose]
    );

    const disabled = useMemo(() => {
        return Boolean(!group.content.maps.length);
    }, [group]);

    const renderContent = useMemo(() => {
        if (!search) {
            return open;
        }
        return Boolean(search && group.content.maps.length > 0);
    }, [search, open, group]);

    return (
        <div className={css['select-multi-group']}>
            <Button className={css['select-multi-btn']} dataTheme="business" size="xs" color="primary" disabled={disabled} active fullWidth onClick={() => setOpen(!open)}>
                <span>{`${group.name} - ${group.title}`}</span>
                {!disabled && <span className={css['select-multi-chevron']}>{String.fromCharCode(open ? '9650' : '9660')}</span>}
            </Button>

            {renderContent && (
                <div className={css['select-multi-group-content']}>
                    {group.content.maps.map((wrl, index) => {
                        return (
                            <div key={index} className={css['select-multi-group-item']} onClick={() => handleSelect(wrl)}>
                                <span>{`- ${wrl?.name}`}</span>
                            </div>
                        );
                    })}
                </div>
            )}
        </div>
    );
};

export const MultiButton = ({ label = '', name, icon = null, open = false, setOpen, children }) => {
    const handleClose = useCallback(() => {
        setOpen(name, !open);
    }, [name, open]);

    return (
        <div className={css[`select-multi-${icon ? 'icon' : 'buttons'}`]}>
            {icon ? <ButtonIcon icon={<Icon name={icon} />} onClick={handleClose} /> : <SelectButton open={open} label={label} onClick={handleClose} />}
            {open && <div className={css['select-multi-content']}>{children}</div>}
        </div>
    );
};

export const Select = ({ label = '', options = [], onSelect = () => {} }) => {
    const [open, setOpen] = useState(false);

    const handleSelect = useCallback(
        (value) => {
            onSelect(value);
            setOpen(false);
        },
        [onSelect]
    );

    return (
        <>
            <SelectButton open={open} label={label} onClick={() => setOpen((prev) => !prev)} />
            {open && (
                <div className={css['select-content']}>
                    {options.map((it) => (
                        <div key={it.key} className={css['select-item']} onClick={() => handleSelect(it.value)}>
                            <span>{it.text}</span>
                        </div>
                    ))}
                </div>
            )}
        </>
    );
};
