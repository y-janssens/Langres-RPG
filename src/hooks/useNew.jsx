import { useState, useEffect, useCallback } from 'react';
import { invoke } from '@tauri-apps/api/core';

export const useNew = ({ func, payload = null, id = null, launch = true, useLoader = false, onSuccess = () => {} }, deps = []) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(false);

    const fetch = useCallback(async () => {
        if (useLoader) {
            setLoading(true);
        }

        await invoke(func, { id, ...payload })
            .then((response) => {
                setData(response);
                onSuccess(response);
            })
            .catch((error) => {
                console.error(error);
            })
            .finally(() => {
                if (useLoader) {
                    setLoading(false);
                }
            });
    }, [id, func, payload, onSuccess, useLoader]);

    useEffect(() => {
        if (launch) {
            fetch();
        }
    }, [launch, id, func, ...deps]); // eslint-disable-line

    return [data, loading, fetch];
};
