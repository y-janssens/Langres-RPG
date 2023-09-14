import { useMemo, useState, useRef, useEffect } from 'react'; // eslint-disable-line
import { World } from '../../../../models';
import css from './minimap.module.css';

export default function MiniMap({ game, position }) {
    const [world] = useState(() => new World(game.world).parse());
    const mapRef = useRef();

    // useEffect(() => {
    //     if (mapRef.current) {
    //         mapRef.current.scrollIntoView({ behavior: 'smooth', block: 'center', inline: 'center' });
    //     }
    // }, [mapRef.current]);

    return (
        <div className={css['mini-map-container']}>
            <div className={css['mini-map-block']}>
                {world.map((row, i) => {
                    return (
                        <div key={i}>
                            {row.map((item, index) => {
                                return <Item key={index} item={item} mapRef={mapRef} position={position} />;
                            })}
                        </div>
                    );
                })}
            </div>
        </div>
    );
}

function Item({ item, position, mapRef }) {
    const pos = useMemo(() => {
        return { x: position[0], y: position[2] };
    }, [position]);

    const validRef = useMemo(() => {
        if (pos.x !== item.x && pos.y !== item.y) {
            return null;
        }
        return mapRef;
    }, [mapRef, item, pos]);

    const itemColor = useMemo(() => {
        const defaultKeys = [
            { key: 'F', value: 'darkgreen' },
            { key: 'T', value: 'green' },
            { key: 'C', value: 'beige' },
            { key: 'R', value: 'darkgray' },
            { key: '-', value: '#505050' }
        ];
        return defaultKeys.find((k) => k.key === item.value).value;
    }, [item]);
    return (
        <div
            className={css['mini-map-item']}
            ref={validRef}
            style={{
                backgroundColor: itemColor
            }}
        >
            {pos.x === item.x && pos.y === item.y && <div style={{ width: '8px', height: '8px', backgroundColor: 'chartreuse', borderRadius: '50%' }} />}
        </div>
    );
}
