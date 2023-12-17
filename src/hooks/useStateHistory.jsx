import { useCallback, useState, useEffect } from 'react';

export const useStateHistory = ({ init = false, listener = null, size = 10 }) => {
    const [history, setHistory] = useState([]);
    const [currentIndex, setCurrentIndex] = useState(0);
    const clearHistory = useCallback(() => {
        setHistory([]);
        setCurrentIndex(0);
        handleState(listener);
    }, [listener]);

    const forward = useCallback(() => {
        setCurrentIndex((currentIndex) => {
            const nextIndex = currentIndex + 1;
            return nextIndex < history.length ? nextIndex : currentIndex;
        });
    }, [history.length]);

    const backward = useCallback(() => {
        setCurrentIndex((currentIndex) => {
            const prevIndex = currentIndex - 1;
            return prevIndex >= 0 ? prevIndex : currentIndex;
        });
    }, []);

    const handleState = useCallback(
        (newState) => {
            setHistory((currentHistory) => {
                const newHistory = [...currentHistory];

                if (newHistory.length >= size) {
                    newHistory.shift();
                }
                newHistory.push(newState);

                setCurrentIndex(newHistory.length - 1);
                return newHistory;
            });
        },
        [size]
    );

    useEffect(() => {
        if (init) {
            handleState(listener);
        }
    }, [init, listener]);

    return [history, currentIndex, forward, backward, clearHistory];
};
