import { useState, useEffect, useCallback } from 'react';
import useGameContext from './useGameContext';
import useAdminContext from './useAdminContext';

const useSettingsProperties = ({ keys = [], validate = () => {} }, deps = []) => {
    const [engine] = useGameContext();
    const { isAdmin } = useAdminContext();
    const [data, setData] = useState(() => formatValues('defaultProperty'));

    function formatValues(fn, onlyValue = false) {
        const _keys = Array.isArray(keys) ? keys : [keys];
        return _keys.reduce((acc, k) => {
            const settingItem = engine.settings[fn](k);
            acc[k] = onlyValue ? settingItem?.value : settingItem;
            return acc;
        }, {});
    }

    const get = useCallback(() => {
        if (isAdmin) {
            setData(formatValues('resolveSettingsProperty', true));
            validate(formatValues('resolveSettingsProperty'));
        }
    }, [formatValues, validate, isAdmin, engine]);

    useEffect(() => {
        get();
    }, [...deps]);

    return data;
};

export default useSettingsProperties;
