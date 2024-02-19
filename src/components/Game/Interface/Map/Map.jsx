import { useRef, useEffect, useCallback, useState } from 'react';
import css from './map.module.css';

export const Map = ({ display = false, engine }) => {
    const {
        world,
        controls: { currentTile }
    } = engine;

    if (!display || !engine) {
        return null;
    }
    return (
        <div className={css['map-container']}>
            <div className={css['map-block']}>
                <MapDisplay map={world.content} currentTile={currentTile} />
            </div>
        </div>
    );
};

const MapDisplay = ({ map, currentTile }) => {
    const canvasRef = useRef(null);
    const [size, setSize] = useState(null);

    const getColor = useCallback((value) => {
        switch (value) {
            case 'T':
                return 'olivedrab';
            case 'W':
                return 'lightskyblue';
            case 'C':
            case 'S':
            case '-':
                return 'darkkhaki';
            default:
                return 'transparent';
        }
    }, []);

    const drawMap = useCallback(
        (ctx) => {
            const hexRadius = 1.165 * (size / 100);
            const hexWidth = Math.sqrt(3) * hexRadius;
            const vertDist = hexRadius * 1.5;

            map.forEach((it) => {
                const col = it.x;
                const row = it.y;
                const x = (col * hexWidth) / 2;
                const y = row * vertDist;

                if (it.x === currentTile?.x && it.y === currentTile?.y) {
                    ctx.fillStyle = 'red';
                } else {
                    ctx.fillStyle = getColor(it.value);
                }

                ctx.beginPath();
                for (let side = 0; side < 7; side++) {
                    const angle = (Math.PI / 3) * side + Math.PI / 6;
                    ctx.lineTo(x + hexRadius * Math.cos(angle), y + hexRadius * Math.sin(angle));
                }
                ctx.closePath();
                ctx.fill();
            });
        },
        [map, size, currentTile]
    );

    useEffect(() => {
        const canvas = canvasRef.current;
        setSize(canvasRef.current?.clientHeight);
        const ctx = canvas.getContext('2d');
        if (size) {
            drawMap(ctx);
        }
    }, [size]);

    return <canvas ref={canvasRef} width={size} height={size} />;
};
