import React, { useState, useEffect } from 'react';
import css from './ui.module.css';

export const OpeningTitle = ({ title, environment }) => {
    const [display, setDisplay] = useState(false);
    const [width, setWidth] = useState(0);

    useEffect(() => {
        if (!display) {
            let intervalUp, intervalDown;

            const timeoutUp = setTimeout(() => {
                setDisplay(true);
                intervalUp = setInterval(() => {
                    setWidth((prevWidth) => {
                        const newWidth = prevWidth + 10;
                        if (newWidth >= 100) {
                            clearInterval(intervalUp);
                            return 100;
                        }
                        return newWidth;
                    });
                }, 50);
            }, 1000);

            const timeoutDown = setTimeout(() => {
                intervalDown = setInterval(() => {
                    setWidth((prevWidth) => {
                        const newWidth = prevWidth - 10;
                        if (newWidth <= 0) {
                            clearInterval(intervalDown);
                            setDisplay(false);
                            return 0;
                        }
                        return newWidth;
                    });
                }, 25);
            }, 4000);

            return () => {
                clearTimeout(timeoutUp);
                clearTimeout(timeoutDown);
                clearInterval(intervalUp);
                clearInterval(intervalDown);
            };
        }
    }, []);

    if (!display) {
        return null;
    }
    return (
        <div
            className={css['opening-title-container']}
            style={{
                width: `${width}%`
            }}
        >
            <span>{`${title.act.name} : ${title.act.title}`}</span>
            <div>{title.map}</div>
            <hr className={css['opening-title-separator']} />
            <span>{environment.date}</span>
        </div>
    );
};
