import { useState, useEffect, useCallback } from 'react';
import css from './ui.module.css';

function Title({ title = '', delay = 50, hide = () => {} }) {
    const [currentText, setCurrentText] = useState('');
    const [currentIndex, setCurrentIndex] = useState(0);
    const [visibility, setVisibility] = useState(1);
    const [parsing, setParsing] = useState(true);

    const handleMenu = useCallback(() => {
        if (!parsing && visibility > 0) {
            const intervalId = setInterval(() => {
                setVisibility((prevOpacity) => {
                    const newOpacity = prevOpacity - 0.1;
                    if (newOpacity <= 0) {
                        clearInterval(intervalId);
                        return 0;
                    }
                    return newOpacity;
                });
            }, 100);
        }
    }, [parsing, visibility]);

    useEffect(() => {
        if (visibility <= 0) {
            hide();
        }
        if (currentIndex < title.length) {
            const timeout = setTimeout(() => {
                setCurrentText((prevText) => prevText + title[currentIndex]);
                setCurrentIndex((prevIndex) => prevIndex + 1);
            }, delay);

            return () => clearTimeout(timeout);
        }
        setParsing(false);
    }, [currentIndex, title, delay, visibility]);

    return (
        <div
            className={css['game-title-container']}
            style={{
                opacity: visibility,
                pointerEvents: parsing ? 'none' : 'initial'
            }}
        >
            <div className={css[!parsing && 'game-title-block']} onClick={handleMenu}>
                <div className={css['game-title']}>Langres</div>
                <span>{currentText}</span>
            </div>
        </div>
    );
}

export default Title;
