import { DragSelectProvider } from '../../../../context';
import { MapGrid } from './Grid';

import css from '../../builder.module.css';

export const FlatMap = ({ form, setForm, world, handleSelect }) => {
    return (
        <DragSelectProvider settings={{ draggability: false, area: document.querySelector('#builder-body-block') }}>
            <div
                className={css['builder-map-grid']}
                style={{
                    columnGap: `${Math.ceil(Math.sqrt(55 * (form.zoom / 100)))}px`,
                    gridTemplateRows: `repeat(${world.size + Math.ceil(Math.sqrt(world.size))}, ${55 * (form.zoom / 100)}px)`,
                    gridTemplateColumns: `repeat(${world.size}, ${55 * (form.zoom / 100)}px)`
                }}
            >
                <MapGrid form={form} setForm={setForm} data={world} handleSelect={handleSelect} />
            </div>
        </DragSelectProvider>
    );
};
