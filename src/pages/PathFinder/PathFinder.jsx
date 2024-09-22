import { invoke } from '@tauri-apps/api';
import { memo, useCallback, useEffect, useMemo, useState } from 'react';

import { useDynamicForm } from '../../hooks';
import { uniqueSelection } from '../../components/utils';

import { Theme, Sidebar, NavBar } from './components';

import css from './pathfinder.module.css';

export const PathFinder = () => {
    const [form, setForm, setFormObject] = useDynamicForm({
        map: {},
        start: null,
        end: null,
        obstacles: [],
        path: [],
        displayIds: true,
        algorithm: 'Astar',
        output: {}
    });

    const generate_world = useCallback(async () => {
        await invoke('generate', { size: 20, name: 'pathfinding', order: 1, primary: true }).then((response) => {
            const obstacles = response.content.filter((it) => !it.walkable).map((it) => it.id);
            setFormObject({ ...form, start: null, end: null, map: response, obstacles });
        });
    }, [form]);

    const handleRandomize = useCallback(async () => {
        await invoke('generate_forest', {
            map: form.map
        }).then((response) => {
            const obstacles = response.content.filter((it) => !it.walkable).map((it) => it.id);
            setFormObject({ ...form, start: null, end: null, map: response, obstacles });
        });
    }, [form]);

    const handleclick = useCallback(
        (item) => {
            if (!item) {
                return;
            }

            // First select start, the endpoint, then obstacles
            switch (true) {
                case Boolean(form.start && !form.end):
                    setForm('end', item);
                    break;
                case Boolean(form.start && form.end):
                    setForm('obstacles', uniqueSelection([...form.obstacles], item.id));
                    break;
                default:
                    setForm('start', item);
                    break;
            }
        },
        [form]
    );

    const handleStart = useCallback(() => {
        // Launch
    }, []);

    useEffect(() => {
        // Rather use this than hardcode an entire map into static datas
        if (!Object.keys(form.map).length) {
            generate_world();
        }
    }, []);

    return (
        <Theme dataTheme="night" className={css['pathfinder-main-container']}>
            <Sidebar form={form} handleReset={generate_world} handleStart={handleStart} handleRandomize={handleRandomize} />
            <NavBar />
            <div className={css['pathfinder-body-container']}>
                <div
                    className={css[`pathfinder-body`]}
                    style={{
                        columnGap: `${Math.ceil(Math.sqrt(55 * 0.8))}px`,
                        gridTemplateRows: `repeat(${form.map.size + Math.ceil(Math.sqrt(form.map.size))}, ${55 * 0.8}px)`,
                        gridTemplateColumns: `repeat(${form.map.size}, ${55 * 0.8}px)`
                    }}
                >
                    {Object.keys(form.map).length > 0 && form.map?.content.map((it) => <Tile key={it.id} form={form} item={it} handleclick={handleclick} />)}
                </div>
            </div>
        </Theme>
    );
};

const Tile = memo(({ form, item, handleclick }) => {
    const [hover, setHover] = useState(false);

    const color = useMemo(() => {
        switch (true) {
            case form.start && form.start.id === item.id:
                return 'green';
            case form.end && form.end.id === item.id:
                return 'red';
            case form.obstacles.includes(item.id):
                return '#808080';
            default:
                return hover ? '#516b8f' : '#334359';
        }
    }, [form, item, hover]);
    return (
        <div
            className={css['pathfinder-map-tile']}
            style={{
                marginLeft: item.y % 2 === 0 && `25px`,
                backgroundColor: color
            }}
            onClick={() => handleclick(item)}
            onMouseEnter={() => setHover(true)}
            onMouseLeave={() => setHover(false)}
        >
            <div className={css['pathfinder-map-tile-text']}>{form.displayIds && <span>{item.id}</span>}</div>
        </div>
    );
});
