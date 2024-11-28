import { useCallback, useEffect, useMemo, useState } from 'react';
import { invoke } from '@tauri-apps/api';
import { useDynamicForm } from '../../hooks';
import { PathFinder as Path, FieldOfView } from '../../models/ia';
import { World } from '../../models';

import _ from 'lodash';
import { executionTime, uniqueSelection } from '../../utils';

import { Theme, Sidebar, NavBar, TileInfo } from './components';

import css from './tools.module.css';

export const Tools = () => {
    const [form, setForm, setFormObject] = useDynamicForm({
        map: {},
        start: null,
        end: null,
        obstacles: [],
        baseObstacles: [],
        borderCount: 0,
        path: [],
        displayIds: true,
        displayCoordinates: true,
        algorithm: 'Astar',
        output: {}
    });

    const generate_world = useCallback(async () => {
        await invoke('generate', { size: 50, name: 'pathfinding', order: 1, primary: true }).then((response) => {
            const width = response.size;
            const height = _.last(response.content).y;
            const obstacles = response.content.filter((it) => !it.walkable).map((it) => it.id);
            const borderCount = width * 2 - 2 + height * 2;
            const start = response.content.find((it) => it.id === 403);
            const end = response.content.find((it) => it.id === 716);

            setFormObject({ ...form, start, end, map: new World(response), baseObstacles: obstacles, obstacles, borderCount, path: [], output: {} });
        });
    }, [form]);

    const handleRandomize = useCallback(async () => {
        await invoke('generate_forest', {
            map: form.map
        }).then((response) => {
            const obstacles = response.content.filter((it) => !it.walkable).map((it) => it.id);
            setFormObject({ ...form, start: null, end: null, map: response, obstacles, path: [], output: {} });
        });
    }, [form]);

    const handleclick = useCallback(
        (item) => {
            if (!item) {
                return;
            }
            // First select start, then endpoint, then obstacles
            switch (true) {
                case Boolean(form.start && !form.end):
                    setForm('end', item);
                    break;
                case Boolean(form.start?.id === item.id):
                    setForm('start', null);
                    break;
                case Boolean(form.end?.id === item.id):
                    setForm('end', null);
                    break;
                case Boolean(form.start && form.end): {
                    const obstacles = uniqueSelection([...form.obstacles], item.id);
                    const content = form.map.content.map((it) => ({
                        ...it,
                        walkable: it.id === item.id ? !it.walkable : !obstacles.includes(it.id)
                    }));
                    setFormObject({ ...form, map: { ...form.map, content }, obstacles });
                    break;
                }
                default:
                    setForm('start', item);
                    break;
            }
        },
        [form]
    );

    const handleStart = useCallback(() => {
        const { result: path, time } = executionTime(() => new Path({ ...form }).find_path(form.start, form.end).map((it) => it.id));
        setFormObject({ ...form, path, algorithm: 'Astar', output: { time, operations: path.length } });
    }, [form]);

    const handleCull = useCallback(() => {
        const { result: cull, time } = executionTime(() => new FieldOfView({ item: form.start, map: form.map }).process());
        setFormObject({ ...form, algorithm: 'FieldOfView', path: cull, output: { time, operations: 0 } });
    }, [form]);

    const handleFunction = useCallback(
        (action) => {
            const actions = {
                start: handleStart,
                cull: handleCull,
                randomize: handleRandomize,
                reset: generate_world
            };
            return actions[action]();
        },
        [handleStart, handleCull, handleRandomize, generate_world]
    );

    useEffect(() => {
        // Rather use this than hardcode an entire map into static datas
        if (!Object.keys(form.map).length) {
            generate_world();
        }
    }, [form]);

    return (
        <Theme dataTheme="night" className={css['tools-main-container']}>
            <Sidebar form={form} handleFunction={handleFunction} />
            <NavBar form={form} setForm={setForm} />
            <div className={css['tools-body-container']}>
                <div
                    className={css[`tools-body`]}
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

const Tile = ({ form, item, handleclick }) => {
    const [hover, setHover] = useState(false);

    const color = useMemo(() => {
        switch (true) {
            case form.start && form.start.id === item.id:
                return 'green';
            case form.end && form.end.id === item.id:
                return 'red';
            case form.obstacles.includes(item.id):
                return '#808080';
            case form.path.includes(item.id):
                return 'yellow';
            default:
                return hover ? '#516b8f' : '#334359';
        }
    }, [form, item, hover]);
    return (
        <div
            className={css['tools-map-tile']}
            style={{
                marginLeft: item.y % 2 === 0 && `25px`,
                backgroundColor: color
            }}
            onClick={() => handleclick(item)}
            onMouseEnter={() => setHover(true)}
            onMouseLeave={() => setHover(false)}
        >
            <div className={css['tools-map-tile-text']}>
                <TileInfo formKey={'displayIds'} form={form} text={item.id} />
                <TileInfo formKey={'displayCoordinates'} form={form} text={`x: ${item.x} - y: ${item.y}`} />
            </div>
        </div>
    );
};
