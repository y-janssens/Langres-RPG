import { useState, useEffect, useCallback } from 'react';
import css from './ui.module.css';

const AnimatedText = ({ npc, delay = 150 }) => {
    const [currentText, setCurrentText] = useState('');
    const [currentIndex, setCurrentIndex] = useState(0);
    const [result, setResult] = useState(() => npc.get_dialogs());
    const [parsing, setParsing] = useState(false);

    const handleNext = useCallback(() => {
        if (result.next) {
            setResult(npc.get_dialogs(result.next));
            setCurrentText('');
            setCurrentIndex(0);
        }
    }, [result]);

    const handleDisplay = useCallback(() => {
        setCurrentText(result.text);
        setCurrentIndex(result.text.length);
    }, [result]);

    useEffect(() => {
        if (currentIndex < result.text.length) {
            setParsing(true);
            const timeout = setTimeout(() => {
                setCurrentText((prevText) => prevText + result.text[currentIndex]);
                setCurrentIndex((prevIndex) => prevIndex + 1);
            }, delay);

            return () => clearTimeout(timeout);
        }
        setParsing(false);
    }, [currentIndex, delay, result]);

    if (!npc) {
        return null;
    }

    return (
        <>
            <div className={css['dialogs-text-container']} onClick={handleDisplay}>
                <span>{currentText}</span>
                <Next display={!parsing && result.next} onClick={handleNext} />
            </div>
        </>
    );
};

export default AnimatedText;

function Next({ display = false, onClick = () => {} }) {
    if (!display) {
        return null;
    }
    return (
        <button className={css['dialogs-next-button']} onClick={onClick}>
            Next &gt;
        </button>
    );
}
