import { useCallback, useState, useMemo } from 'react';
import { invoke } from '@tauri-apps/api';
import { Button, Input } from 'react-daisyui';
import { Toggle } from './Toggle';
import { useTranslation } from 'react-i18next';
import Icon from '../../../components/ui/Icon';
import css from '../builder.module.css';

export const SideBar = ({ form, setForm, setFormObject }) => {
    const { t } = useTranslation();

    const map = useMemo(() => {
        if (!form.selectedMap) {
            return null;
        }
        return form.selectedMap;
    }, [form]);

    const handleChange = useCallback(
        (item, primary = false) => {
            if (item.name === 'gate') {
                return setForm('modalGateway', !form.modalGateway);
            }

            let act = { ...form.storyLine.story.acts.find((act) => act.id === form.selectedAct.id) };
            let mapIndex = act.content.maps.findIndex((mp) => mp.name === form.selectedMap.name);
            let newMap = { ...act.content.maps[mapIndex] };

            if (!primary) {
                if (!item.value && form.selectedTiles.length === 1) {
                    newMap.starting_point = { x: form.selectedTiles[0].x, y: form.selectedTiles[0].y, id: form.selectedTiles[0].id };
                }
                const items = form.selectedTiles.map((it) => ({ ...it, value: item.value || it.value, walkable: item.walkable }));
                let newContent = newMap.content.map((item) => {
                    const foundItem = items.find((it) => it.id === item.id);
                    return foundItem ? { ...item, value: foundItem.value, walkable: foundItem.walkable } : { ...item };
                });

                newMap.content = newContent;
            } else {
                newMap.primary = item;
            }
            act.content.maps[mapIndex] = newMap;
            setFormObject({ ...form, selectedMap: newMap, selectedTiles: [] });
        },
        [form]
    );

    const handleObject = useCallback(
        (object) => {
            setFormObject({
                ...form,
                interactiveMode: { toggle: !form.interactiveMode.toggle, object: !form.interactiveMode.object ? object : null, neighbours: [] },
                showConstraints: !form.interactiveMode.object,
                showValues: !form.interactiveMode.object,
                showIcons: Boolean(form.interactiveMode.object)
            });
        },
        [form]
    );

    const handleFunction = useCallback(
        async (command) => {
            await invoke(command, {
                map: form.selectedMap
            }).then((data) => {
                setForm('selectedMap', data);
            });
        },
        [form]
    );

    return (
        <div className={css['builder-sidebar-container']}>
            {form.selectedMap && (
                <MenuBlock title={t('builder.menu.map.label')} grid={false}>
                    <div className={css['builder-map-infos']}>
                        <div className={css['builder-map-infos-title']}>{`${form.selectedAct.name} - ${form.selectedAct.title}`}</div>
                        <span className={css['builder-map-infos-item']}>
                            <span>
                                <p>{`${t('builder.menu.map.name')}:`}</p>
                                <span>{map.name}</span>
                            </span>
                            <span>
                                <p>{`${t('builder.menu.map.id')}:`}</p>
                                <span>{map.id}</span>
                            </span>
                            <span>
                                <p>{`${t('builder.menu.map.start')}:`}</p>
                                <span>{`X: ${map.starting_point.x} Y: ${map.starting_point.y} Id: ${map.starting_point.id}`}</span>
                            </span>
                            <span>
                                <p>{`${t('builder.menu.map.size')}:`}</p>
                                <span>{map.size}</span>
                            </span>
                            <span>
                                <Toggle title={`${t('builder.menu.map.primary')}:`} active={map.primary} onChange={({ target: { checked } }) => handleChange(checked, true)} />
                            </span>
                        </span>
                    </div>
                </MenuBlock>
            )}
            {Boolean(form.selectedTiles.length) && (
                <MenuBlock title={t('builder.menu.tile.label')} grid={false}>
                    <div className={css['builder-map-infos-selected']}>
                        {form.selectedTiles
                            .sort((a, b) => {
                                return a.id - b.id;
                            })
                            .map((it) => {
                                return (
                                    <div className={css['builder-map-infos-selected-detail']} key={it.id}>
                                        <p>{`Id: ${it.id} X: ${it.x} Y: ${it.y}`}</p>
                                        <Input dataTheme="dark" size="xs" value={it.value} color="neutral" onChange={() => {}} />
                                    </div>
                                );
                            })}
                    </div>
                </MenuBlock>
            )}
            <MenuBlock title={t('builder.menu.items.items')}>
                {form.objects
                    .filter((it) => !it.interactive)
                    .map((it) => {
                        return (
                            <MenuItem
                                key={it.id}
                                icon={it.name}
                                label={t(`builder.menu.objects.${it.name}`)}
                                disabled={!form.selectedMap || !form.selectedTiles.length || (!it.value && form.selectedTiles.length > 1)}
                                onClick={() => handleChange(it)}
                            />
                        );
                    })}
            </MenuBlock>
            <MenuBlock title={t('builder.menu.items.objects')}>
                {form.objects
                    .filter((it) => it.interactive)
                    .map((it) => {
                        return (
                            <MenuItem
                                key={it.id}
                                icon={it.name}
                                label={t(`builder.menu.objects.${it.name}`)}
                                active={form.interactiveMode.toggle && form.interactiveMode.object.id === it.id}
                                disabled={form.interactiveMode.toggle && form.interactiveMode.object.id !== it.id}
                                onClick={() => handleObject(it)}
                            />
                        );
                    })}
            </MenuBlock>
            <MenuBlock title={t('builder.menu.functions.label')}>
                <MenuItem
                    icon={'map'}
                    disabled={!form.selectedMap || form.interactiveMode.toggle}
                    label={t('builder.menu.functions.generate-maps')}
                    onClick={() => setForm('modalGenerator', true)}
                />
                {form.functions.map((it) => {
                    const label = it.label.toLowerCase().replaceAll(' ', '-');
                    return (
                        <MenuItem
                            key={it.id}
                            icon={it.icon}
                            disabled={!form.selectedMap || form.interactiveMode.toggle}
                            label={t(`builder.menu.functions.${label}`)}
                            onClick={() => handleFunction(it.command)}
                        />
                    );
                })}
            </MenuBlock>
        </div>
    );
};

export const MenuItem = ({ icon = null, label = null, active = false, disabled, onClick = () => {} }) => {
    return (
        <div
            className={css['builder-sidebar-functions-item']}
            style={{
                pointerEvents: disabled ? 'none' : 'initial'
            }}
        >
            <Button
                dataTheme="dark"
                disabled={disabled}
                color={active ? 'accent' : 'default'}
                variant="outline"
                shape="square"
                size="md"
                onClick={onClick}
                style={{
                    opacity: disabled ? '0.5' : 1
                }}
            >
                <Icon name={icon} />
            </Button>
            {label && (
                <div
                    style={{
                        opacity: disabled ? '0.5' : 1
                    }}
                >
                    {label}
                </div>
            )}
        </div>
    );
};

export const MenuBlock = ({ title = '', children, grid = true }) => {
    const [active, setActive] = useState(true);
    return (
        <div className={css['builder-sidebar-block']}>
            <Button dataTheme="light" size="sm" color="neutral" onClick={() => setActive(!active)}>
                {title}
            </Button>
            {active && <div className={css[grid ? 'builder-sidebar-block-content' : 'builder-sidebar-block-settings']}>{children}</div>}
        </div>
    );
};
