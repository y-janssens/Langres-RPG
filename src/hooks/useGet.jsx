import { useState, useEffect, useCallback } from 'react';
import { invoke } from '@tauri-apps/api';

const useGet = ({ func, payload = null, id = null, launch = true, onSuccess = () => {} }, deps = []) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(false);

    const fetch = useCallback(async () => {
        setLoading(true);

        await invoke(func, { id, ...payload })
            .then((response) => {
                setData(response);
                onSuccess(response);
            })
            .catch((error) => {
                console.error(error);
            })
            .finally(() => {
                setLoading(false);
            });
    }, [id, func, payload, onSuccess]);

    useEffect(() => {
        if (launch) {
            fetch();
        }
    }, [launch, id, func, ...deps]); // eslint-disable-line

    return [data, loading, fetch];
};

export { useGet };
