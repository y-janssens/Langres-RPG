import { useMemo, useState, useRef, useEffect } from 'react';
import css from './minimap.module.css';

export default function MiniMap({ position, context }) {
    const { map } = context;
    const [active, setActive] = useState(false);
    const mapContainerRef = useRef();
    const mapInnerContainerRef = useRef();

    const characterPosition = useMemo(() => {
        return { x: position[0] * 11 - 148 * 1.8, y: position[2] * 11 - 526 / 2.05 };
    }, [position, mapInnerContainerRef, mapInnerContainerRef?.current]);

    useEffect(() => {
        if (mapContainerRef.current && mapInnerContainerRef.current) {
            mapInnerContainerRef.current.style.left = `${characterPosition.x}px`;
            mapInnerContainerRef.current.style.top = `${characterPosition.y}px`;
        }
    }, [mapContainerRef, mapInnerContainerRef, characterPosition]);

    return (
        <div
            className={css['mini-map-container']}
            ref={mapContainerRef}
            onClick={() => setActive(!active)}
            style={{
                width: active ? '200px' : '148px',
                height: active ? '200px' : '148px'
            }}
        >
            <div className={css['mini-map-block']} ref={mapInnerContainerRef}>
                {map.map((row, i) => {
                    return (
                        <div key={i}>
                            {row.map((item, index) => {
                                return <Item key={index} item={item} position={position} context={context} />;
                            })}
                        </div>
                    );
                })}
            </div>
        </div>
    );
}

function Item({ item, position, context }) {
    const pointer = useMemo(() => {
        return Boolean(position[0] === item.x && position[2] === item.y);
    }, [position, item]);

    return (
        <div
            className={css['mini-map-item']}
            style={{
                backgroundColor: context.assets.get_color(item)
            }}
        >
            {pointer && <Pointer context={context} />}
        </div>
    );
}

function Pointer({ context }) {
    const cone = useMemo(() => {
        let rotation;
        let position;
        switch (context.direction) {
            case 'down':
                rotation = context.previousDirection === 'right' ? '-270deg' : '90deg';
                position = '0px 0px 0px -40px';
                break;
            case 'up':
                rotation = '-90deg';
                position = '0px 0px 0px 40px';
                break;
            case 'right':
                rotation = context.previousDirection === 'down' || !('previousDirection' in context) ? '180deg' : '-180deg';
                position = '-40px 0px 0px 0px';
                break;
            case 'left':
                rotation = '0deg';
                position = '40px 0px 0px 0px';
                break;
            default:
                rotation = '90deg';
                position = '0px 0px 0px -40px';
        }
        return { rotation, position };
    }, [context, context.direction, context.previousDirection]);

    return (
        <>
            <div className={css['mini-map-character']} />
            <div
                className={css['mini-map-character-arrow']}
                style={{
                    transform: `rotateZ(${cone.rotation})`,
                    margin: cone.position
                }}
            />
        </>
    );
}
