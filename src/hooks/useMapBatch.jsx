import { useState, useEffect, useRef, useCallback } from 'react';
import { invoke } from '@tauri-apps/api/core';

const useMapBatch = ({ map = {}, options = {}, amount = 5, launch = true, onSuccess = () => {} }) => {
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false);
    const progress = useRef(0);
    const timeoutRef = useRef(null);

    const batch = useCallback(async () => {
        if (progress.current < amount) {
            await invoke('generate_map_content', { map, options })
                .then((response) => {
                    setData((prevData) => [...prevData, response]);
                    progress.current += 1;

                    if (progress.current < amount) {
                        timeoutRef.current = setTimeout(batch, 1000);
                    } else {
                        setLoading(false);
                    }
                })
                .catch((error) => {
                    console.error(error);
                    setLoading(false);
                });
        }
        if (progress.current === amount) {
            onSuccess();
        }
    }, [progress, amount, map, options, onSuccess]);

    const cancel = useCallback(() => {
        if (timeoutRef.current) {
            clearTimeout(timeoutRef.current);
            timeoutRef.current = null;
        }
        setLoading(false);
        progress.current = 0;
    }, []);

    const sync = useCallback(() => {
        cancel();
        setData([]);
    }, [cancel]);

    useEffect(() => {
        if (launch) {
            setLoading(true);
            batch();

            return () => {
                if (timeoutRef.current) {
                    clearTimeout(timeoutRef.current);
                    timeoutRef.current = null;
                }
                setLoading(false);
                progress.current = amount;
            };
        }
    }, [launch]);

    return [data, progress.current, loading, sync, cancel];
};

export { useMapBatch };
