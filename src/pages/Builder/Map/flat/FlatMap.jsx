import { useMemo } from 'react';
import { DragSelectProvider } from '../../../../context';
import { MapGrid } from './Grid';

import css from '../../builder.module.css';

export const FlatMap = ({ form, setForm, setFormObject, world, handleSelect }) => {
    const gridStyle = useMemo(() => {
        const scaledTileSize = 55 * (form.zoom / 100);
        return {
            columnGap: `${Math.ceil(Math.sqrt(scaledTileSize))}px`,
            gridTemplateRows: `repeat(${world.size + Math.ceil(Math.sqrt(world.size))}, ${scaledTileSize}px)`,
            gridTemplateColumns: `repeat(${world.size}, ${scaledTileSize}px)`
        };
    }, [form.zoom, world.size]);

    return (
        <DragSelectProvider settings={{ draggability: false, area: document.querySelector('#builder-body-block') }}>
            <div className={css['builder-map-grid']} style={gridStyle}>
                <MapGrid form={form} setForm={setForm} setFormObject={setFormObject} data={world} handleSelect={handleSelect} />
            </div>
        </DragSelectProvider>
    );
};
