import { useState, useEffect, useRef, useCallback } from 'react';
import { invoke } from '@tauri-apps/api';

const useMapBatch = ({ options = {}, amount = 5, launch = true, onSuccess = () => {} }) => {
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false);
    const progress = useRef(0);

    const batch = useCallback(async () => {
        if (progress.current < amount) {
            await invoke('generate_maps_batch', { options })
                .then((response) => {
                    setData((prevData) => [...prevData, response]);
                    progress.current += 1;

                    if (progress.current < amount) {
                        setTimeout(batch, 1000);
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
    }, [progress, amount, options, onSuccess]);

    const sync = useCallback(() => {
        setData([]);
        setLoading(false);
        progress.current = 0;
    }, [progress]);

    useEffect(() => {
        if (launch) {
            setLoading(true);
            batch();

            return () => {
                setLoading(false);
                progress.current = amount;
            };
        }
    }, [launch]);

    return [data, progress.current, loading, sync];
};

export { useMapBatch };
