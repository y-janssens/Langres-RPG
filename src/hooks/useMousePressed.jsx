import React, { useMemo } from 'react';

const useMousePressed = () => {
    const [counter, setCounter] = React.useState(0);
    const intervalRef = React.useRef(null);

    const pressed = useMemo(() => counter > 0, [counter]);

    const startCounter = () => {
        if (intervalRef.current) return;
        intervalRef.current = setInterval(() => {
            setCounter((prevCounter) => prevCounter + 1);
        }, 250);
    };

    const stopCounter = () => {
        if (intervalRef.current) {
            clearInterval(intervalRef.current);
            intervalRef.current = null;
            setCounter(0);
        }
    };

    React.useEffect(() => {
        return () => stopCounter();
    }, []);

    return [pressed, startCounter, stopCounter];
};

export default useMousePressed;
