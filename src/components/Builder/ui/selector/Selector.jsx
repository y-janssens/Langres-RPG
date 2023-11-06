import { useCallback, useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Button, Input } from 'react-daisyui';
import css from './selector.module.css';

export const MultiSelect = ({ datas, label = '', onSelect = () => {} }) => {
    const { t } = useTranslation();
    const [open, setOpen] = useState(false);
    const [search, setSearch] = useState('');

    const groups = useMemo(() => {
        if (!datas) {
            return [];
        }
        if (!search || search === '') {
            return datas.story.acts.map((act) => act);
        }
        return datas.story.acts.filter((act) => act.content.maps.some((wrl) => wrl.name.includes(search)));
    }, [datas, search]);

    const disabled = useMemo(() => {
        return datas?.story.acts.every((act) => !act.content.maps.length);
    }, [datas]);

    return (
        <div className={css['select-multi-container']}>
            <SelectButton label={label} open={open} onClick={() => setOpen(!open)} />
            {open && datas && (
                <div className={css['select-multi-content']}>
                    <Input
                        className={css['select-multi-searchbar']}
                        dataTheme="dark"
                        size="xs"
                        placeholder={`${t('actions.search')}...`}
                        bordered
                        value={search}
                        disabled={disabled}
                        onChange={(e) => setSearch(e.target.value)}
                    />
                    {groups.map((gr, index) => {
                        return <SelectGroup key={index} group={gr} onSelect={onSelect} onClose={() => setOpen(false)} />;
                    })}
                </div>
            )}
        </div>
    );
};

export const SelectButton = ({ label, open = false, onClick = () => {}, size = 'xs' }) => {
    return (
        <div className={css['selector-select-btn']}>
            <Button dataTheme="dark" size={size} color="neutral" active={open} variant="outline" fullWidth onClick={onClick} animation={false}>
                <div className={css['select-multi-label']}>
                    <span>{label}</span>
                    <span className={css['select-multi-chevron']}>{String.fromCharCode(open ? '9650' : '9660')}</span>
                </div>
            </Button>
        </div>
    );
};

export const SelectGroup = ({ group, onSelect = () => {}, onClose = () => {} }) => {
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

    return (
        <div className={css['select-multi-group']}>
            <Button className={css['select-multi-btn']} dataTheme="business" size="xs" color="primary" disabled={disabled} active fullWidth onClick={() => setOpen(!open)}>
                <span>{`${group.name} - ${group.title}`}</span>
                {!disabled && <span className={css['select-multi-chevron']}>{String.fromCharCode(open ? '9650' : '9660')}</span>}
            </Button>

            <div className={css['select-multi-group-content']}>
                {open &&
                    group.content.maps.map((wrl, index) => {
                        return (
                            <div key={index} className={css['select-multi-group-item']}>
                                <span onClick={() => handleSelect(wrl)}>{`- ${wrl?.name}`}</span>
                            </div>
                        );
                    })}
            </div>
        </div>
    );
};
