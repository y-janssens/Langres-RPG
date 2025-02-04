import { useState, useEffect, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import { invoke } from '@tauri-apps/api/core';
import { Dice } from '../models';

export const useDice = (value, cap = 10) => {
    const { t } = useTranslation();
    const [data, setData] = useState(null);

    const fetch = useCallback(async () => {
        await invoke('throw_dice', { value, cap })
            .then(({ status, value }) => {
                setData(new Dice({ value, cap, result: { status: t(`engine.dice.${status}`), value } }));
            })
            .catch((error) => {
                console.error(error);
            });
    }, [value, cap]);

    useEffect(() => {
        fetch();
    }, []);

    return [data, fetch];
};
