import { useCallback, useState, useMemo } from 'react';
import { invoke } from '@tauri-apps/api';
import { Button, Input } from 'react-daisyui';
import Icon from '../../ui/Icon';
import css from '../builder.module.css';

export const Menu = ({ form, setForm, state, storyline, sync }) => {
    const map = useMemo(() => {
        if (form.selectedMap === 'default') {
            return null;
        }
        return form.selectedMap;
    }, [form.selectedMap]);

    const handleChange = useCallback(
        (value) => {
            const items = form.selectedTiles.map((it) => {
                it.value = value;
                return it;
            });
            setForm('selectedTiles', items);
        },
        [form.selectedTiles]
    );

    const handleFunction = useCallback(
        async (command) => {
            let payload = {};

            switch (command) {
                case 'populate_trees':
                    payload['data'] = form.selectedMap.content;
                    break;
                case 'regenerate':
                    payload['size'] = form.selectedMap.size;
                    break;
                default:
                    break;
            }

            await invoke(command, payload)
                .then((data) => {
                    let act = storyline.story.acts.find((act) => act.id === form.selectedAct.id);
                    let map = act.content.maps.find((mp) => mp.name === form.selectedMap.name);
                    map.content = data;
                    setForm('selectedMap', map);
                })
                .finally(() => {
                    invoke('save_storyline', { data: storyline }).then(() => {
                        sync();
                    });
                });
        },
        [form, storyline, sync]
    );

    return (
        <div className={css['builder-sidebar-container']}>
            {form.selectedMap !== 'default' && (
                <MenuBlock title="Map Informations" grid={false}>
                    <div className={css['builder-map-infos']}>
                        <div className={css['builder-map-infos-title']}>{`${form.selectedAct.name} - ${form.selectedAct.title}`}</div>
                        <span className={css['builder-map-infos-item']}>
                            <span>
                                <p>Name:</p>
                                <span>{map.name}</span>
                            </span>

                            <span>
                                <p>Size:</p>
                                <span>{map.size}</span>
                            </span>
                        </span>
                    </div>
                </MenuBlock>
            )}
            {form.selectedTiles.length > 0 && (
                <MenuBlock title="Tile Settings" grid={false}>
                    <div className={css['builder-map-infos-selected']}>
                        {form.selectedTiles
                            .sort((a, b) => {
                                return a.id - b.id;
                            })
                            .map((it) => {
                                return (
                                    <div className={css['builder-map-infos-selected-detail']} key={it.id}>
                                        <p>{`Id: ${it.id}`}</p>
                                        <Input dataTheme="dark" size="xs" value={it.value} color="neutral" onChange={() => {}} />
                                    </div>
                                );
                            })}
                    </div>
                </MenuBlock>
            )}
            <MenuBlock title="Items">
                {state?.items.map((it) => {
                    return (
                        <MenuItem
                            key={it.id}
                            icon={it.icon}
                            disabled={form.selectedMap === 'default'}
                            // active={form.selectedItem === it.id}
                            onClick={() => handleChange(it.value)}
                        />
                    );
                })}
            </MenuBlock>
            <MenuBlock title="Functions">
                {state?.functions.map((it) => {
                    return <MenuItem key={it.id} icon={it.icon} disabled={form.selectedMap === 'default'} label={it.label} onClick={() => handleFunction(it.command)} />;
                })}
            </MenuBlock>
            <MenuBlock title="Objects" />
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
                <span
                    style={{
                        opacity: disabled ? '0.5' : 1
                    }}
                >
                    {label}
                </span>
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
