import { useCallback, useState, useMemo } from 'react';
import { invoke } from '@tauri-apps/api/core';
import { Button, Input } from 'react-daisyui';
import { Toggle } from './Toggle';
import { useTranslation } from 'react-i18next';
import { Icon } from '../../../components';
import css from '../builder.module.css';

export const SideBar = ({ form, setForm, setFormObject }) => {
    const { t } = useTranslation();

    const map = useMemo(() => {
        if (!form.selectedMap) {
            return null;
        }
        return form.selectedMap;
    }, [form.selectedMap]);

    const itemObjects = useMemo(() => {
        return form.objects.filter((it) => !it.interactive && it.value);
    }, [form.objects]);

    const utilityObjects = useMemo(() => {
        return form.objects.filter((it) => !it.value);
    }, [form.objects]);

    const interactiveObjects = useMemo(() => {
        return form.objects.filter((it) => it.interactive);
    }, [form.objects]);

    const handleChange = useCallback(
        (item, primary = false) => {
            const gateWayOpened = form.modal.type === 'gateway';
            const npcOpened = form.modal.type === 'npc';

            if (item.name === 'gate') {
                return setForm('modal', { type: gateWayOpened ? null : 'gateway', open: !gateWayOpened, value: null });
            }
            if (item.name === 'npc') {
                return setForm('modal', { type: npcOpened ? null : 'npc', open: !npcOpened, value: form.selectedTiles[0] });
            }

            let act = { ...form.storyLine.acts.find((act) => act.id === form.selectedAct.id) };
            let mapIndex = act.maps.findIndex((mp) => mp.id === form.selectedMap.id);
            let newMap = { ...act.maps[mapIndex] };

            if (!primary) {
                if (!item.value && form.selectedTiles.length === 1) {
                    newMap.starting_point = { x: form.selectedTiles[0].x, y: form.selectedTiles[0].y, id: form.selectedTiles[0].id };
                }
                const updatedItems = new Map(
                    form.selectedTiles.map((tile) => [
                        tile.id,
                        {
                            ...tile,
                            value: item.value,
                            walkable: item.walkable,
                            display_value: item.display_value,
                            display_color: item.display_color
                        }
                    ])
                );

                const newContent = newMap.content.map((mapItem) => (updatedItems.has(mapItem.id) ? updatedItems.get(mapItem.id) : mapItem));

                newMap.content = newContent;
            } else {
                newMap.primary = item;
            }
            act.maps[mapIndex] = newMap;
            setFormObject((prev) => ({ ...prev, selectedMap: newMap, selectedTiles: [] }));
        },
        [form]
    );

    const handleDirections = useCallback(
        (item) => {
            let act = { ...form.storyLine.acts.find((act) => act.id === form.selectedAct.id) };
            let mapIndex = act.maps.findIndex((mp) => mp.name === form.selectedMap.name);
            let newMap = { ...act.maps[mapIndex] };

            const updatedItems = new Map(
                form.selectedTiles.map((tile) => [
                    tile.id,
                    {
                        ...tile,
                        display_direction: item.display_direction !== 'undefined' ? item.display_direction : tile.display_direction
                    }
                ])
            );

            const newContent = newMap.content.map((mapItem) => (updatedItems.has(mapItem.id) ? updatedItems.get(mapItem.id) : mapItem));

            newMap.content = newContent;

            act.maps[mapIndex] = newMap;
            setFormObject((prev) => ({ ...prev, selectedMap: newMap, selectedTiles: [] }));
        },
        [form]
    );

    const handleObject = useCallback((object) => {
        setFormObject((prev) => ({
            ...prev,
            interactiveMode: { toggle: !prev.interactiveMode.toggle, object: !prev.interactiveMode.object ? object : null, neighbours: [], isValid: true },
            showConstraints: !prev.interactiveMode.object,
            showValues: !prev.interactiveMode.object,
            showIcons: Boolean(prev.interactiveMode.object)
        }));
    }, []);

    const handleFunction = useCallback(
        async (command) => {
            await invoke(command, {
                map: form.selectedMap
            }).then((data) => {
                let act = { ...form.storyLine.acts.find((act) => act.id === form.selectedAct.id) };
                let mapIndex = act.maps.findIndex((mp) => mp.name === form.selectedMap.name);
                act.maps[mapIndex] = data;

                setFormObject((prev) => ({ ...prev, selectedMap: data, selectedTiles: [] }));
            });
        },
        [form]
    );

    return (
        <div className={css[`builder-sidebar-container-${!form.drawingMode.toggle ? 'active' : 'reduced'}`]}>
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
            {!!form.selectedTiles.length && (
                <MenuBlock title={t('builder.menu.tile.label')} grid={false}>
                    <div className={css['builder-map-infos-selected']}>
                        {form.selectedTiles
                            ?.sort((a, b) => a.id - b.id)
                            .map((it) => (
                                <div className={css['builder-map-infos-selected-detail']} key={it.id}>
                                    <p>{`Id: ${it.id} X: ${it.x} Y: ${it.y}`}</p>
                                    <Input readOnly size="xs" color="neutral" dataTheme="dark" value={it.value} />
                                </div>
                            ))}
                    </div>
                </MenuBlock>
            )}
            {form.showDirections && (
                <MenuBlock title={t('builder.menu.items.directions')} gridSize={3}>
                    {form.directions.map((it) => (
                        <MenuItem
                            key={it.display_direction?.output ?? 'erase'}
                            icon={it.display_direction?.output ?? 'erase'}
                            label={t(`builder.menu.directions.${it.display_direction?.output || null}`)}
                            disabled={!form.selectedMap || !form.selectedTiles.length}
                            onClick={() => handleDirections(it)}
                        />
                    ))}
                </MenuBlock>
            )}
            <MenuBlock title={t('builder.menu.items.items')}>
                {itemObjects.map((it) => (
                    <MenuItem
                        key={it.id}
                        icon={it.name}
                        label={t(`builder.menu.objects.${it.name}`)}
                        disabled={!form.selectedMap || !form.selectedTiles.length}
                        onClick={() => handleChange(it)}
                    />
                ))}
            </MenuBlock>
            <MenuBlock title={t('builder.menu.items.utilities')}>
                {utilityObjects.map((it) => (
                    <MenuItem
                        key={it.id}
                        icon={it.name}
                        label={t(`builder.menu.objects.${it.name}`)}
                        disabled={!form.selectedMap || !form.selectedTiles.length || form.selectedTiles.length > 1}
                        onClick={() => handleChange(it)}
                    />
                ))}
            </MenuBlock>
            <MenuBlock title={t('builder.menu.items.objects')} open={!form.showDirections}>
                {interactiveObjects.map((it) => (
                    <MenuItem
                        key={it.id}
                        icon={it.name}
                        label={t(`builder.menu.objects.${it.name}`)}
                        active={form.interactiveMode.toggle && form.interactiveMode.object.id === it.id}
                        disabled={(form.interactiveMode.toggle && form.interactiveMode.object.id !== it.id) || form.showDirections}
                        onClick={() => handleObject(it)}
                    />
                ))}
            </MenuBlock>
            <MenuBlock title={t('builder.menu.functions.label')} open={!form.showDirections}>
                <MenuItem
                    icon={'map'}
                    disabled={!form.selectedMap || form.interactiveMode.toggle}
                    label={t('builder.menu.functions.generate-maps')}
                    onClick={() => setForm('modal', { type: 'generator', open: true })}
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

export const MenuItem = ({ icon = null, label = null, active = false, disabled, onClick = () => {}, ...props }) => {
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
                {...props}
            >
                <Icon name={icon} {...props} />
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

export const MenuBlock = ({ title = '', children, grid = true, open = true, gridSize = 4, ...props }) => {
    const [toggle, setToggle] = useState(() => open);

    const active = useMemo(() => {
        if (!open) {
            return !toggle;
        }
        return toggle;
    }, [open, toggle]);

    return (
        <div className={css['builder-sidebar-block']}>
            <Button dataTheme="light" size="sm" color="neutral" onClick={() => setToggle(!toggle)} fullWidth={props.fullWidth}>
                {title}
            </Button>
            {active && (
                <div
                    style={{
                        gridTemplateColumns: `repeat(${gridSize}, minmax(0, 1fr))`
                    }}
                    className={css[grid ? 'builder-sidebar-block-content' : 'builder-sidebar-block-settings']}
                >
                    {children}
                </div>
            )}
        </div>
    );
};
