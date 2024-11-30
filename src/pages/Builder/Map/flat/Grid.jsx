import React, { useCallback, useMemo, useEffect, useState } from 'react';
import { useDragSelect } from '../../../../context';
import { Maptile } from './Tile';

export const MapGrid = ({ form, setForm, data, handleSelect }) => {
    const [hover, setHover] = useState(null);
    const ds = useDragSelect();

    const isStartingPoint = useCallback((item, startingPoint) => {
        return item.x / 1.5 === startingPoint.x && item.y + 2 === startingPoint.y;
    }, []);

    const mapItems = useMemo(() => {
        return data.content?.map((item) => ({
            ...item,
            start: isStartingPoint(item, data.starting_point)
        }));
    }, [data.content, data.starting_point]);

    useEffect(() => {
        if (!ds) return;
        const cb = ({ items = [] }) => {
            if (!items.length) {
                setForm('selectedTiles', []);
            }
            if (items.length > 1) {
                setForm(
                    'selectedTiles',
                    items.map((it) => it.tile)
                );
            }
        };
        ds?.subscribe('DS:end', cb);
        return () => {
            ds?.unsubscribe('DS:end', cb);
        };
    }, [ds]);

    return mapItems?.map((item, index) => {
        return <Maptile key={index} ds={ds} item={item} form={form} setForm={setForm} hover={hover} setHover={setHover} handleSelect={handleSelect} />;
    });
};
