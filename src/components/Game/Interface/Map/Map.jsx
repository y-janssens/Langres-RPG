import { useRef, useEffect, useMemo } from 'react';
import css from './map.module.css';

export const Map = ({ display = false, position, context }) => {
    const { map } = context;
    const mapContainerRef = useRef();
    const mapInnerContainerRef = useRef();

    const dimensions = useMemo(() => {
        const width = mapInnerContainerRef.current ? mapInnerContainerRef.current.clientWidth : 640;
        const height = mapInnerContainerRef.current ? mapInnerContainerRef.current.clientHeight : 750;
        return { width, height, size: width / 40 };
    }, [mapInnerContainerRef, mapInnerContainerRef?.current]);

    const characterPosition = useMemo(() => {
        const x = position[0] * dimensions.size - dimensions.width / 1.63;
        const y = position[2] * dimensions.size - dimensions.height / 1.85;

        return { x, y };
    }, [position, mapInnerContainerRef, dimensions]);

    useEffect(() => {
        if (mapContainerRef.current && mapInnerContainerRef.current) {
            const width = dimensions.width / 11.63;
            const height = dimensions.height / 3.48;
            mapInnerContainerRef.current.style.left = `${Math.max(-width, Math.min(width, characterPosition.x))}px`;
            mapInnerContainerRef.current.style.top = `${Math.max(-height, Math.min(width, characterPosition.y))}px`;
        }
    }, [mapContainerRef, mapInnerContainerRef, characterPosition, dimensions]);

    if (!display) {
        return null;
    }
    return (
        <div className={css['map-container']} ref={mapContainerRef}>
            <div className={css['map-block']} >
                <div className={css['map-content']} ref={mapInnerContainerRef}>
                    {map.map((row, i) => {
                        return (
                            <div key={i}>
                                {row.map((item, index) => {
                                    return (
                                        <div
                                            key={index}
                                            style={{
                                                width: `${dimensions.size - 1}px`,
                                                height: `${dimensions.size - 1}px`,
                                                backgroundColor: position[0] === item.x && position[2] === item.y ? 'chartreuse' : context?.assets?.get_color(item),
                                                fontSize: '10px'
                                            }}
                                        />
                                    );
                                })}
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
};
