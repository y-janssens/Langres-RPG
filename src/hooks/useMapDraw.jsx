import { useEffect, useCallback, useRef } from 'react';
import { invoke } from '@tauri-apps/api/core';

const useMapDraw = ({ map = {}, tiles = new Set(), launch = false, filter = false, options = {}, onSuccess = () => {} }) => {
    const onSuccessRef = useRef(onSuccess);
    const inFlightRef = useRef(false);
    const lastKeyRef = useRef(null);
    const lastSentKeyRef = useRef(null);

    const validateCall = useCallback(() => {
        const ids = [...tiles].sort((a, b) => a - b);
        const key = `${map.id}_${options.brush}_${options.density ?? 0}_${options.overwrite ? 1 : 0}_${ids.join(',')}`;

        if (inFlightRef.current || key === lastSentKeyRef.current) return;

        lastKeyRef.current = key;
        inFlightRef.current = true;

        return ids;
    }, [options, tiles, map]);

    const getIds = useCallback(
        (ids) =>
            new Set(
                ids.flatMap((id) => {
                    const tile = map.content[id];
                    return tile ? [id, ...tile.neighbours_ids] : [];
                })
            ),
        [map.content]
    );

    const filterOutput = useCallback(
        (ids = [], resp = []) => {
            if (!filter) {
                return resp;
            }

            const output_ids = getIds(ids);

            return resp.filter((it) => output_ids.has(it.id));
        },
        [filter, getIds]
    );

    const execute = useCallback(async () => {
        const ids = validateCall();

        if (!ids) return;

        await invoke('draw_map_content', { map, tiles: ids, ...options })
            .then((response) => onSuccessRef.current(filterOutput(ids, response)))
            .catch((e) => console.error(e))
            .finally(() => {
                inFlightRef.current = false;
                lastSentKeyRef.current = lastKeyRef.current;
            });
    }, [map, options, validateCall, filterOutput]);

    useEffect(() => {
        onSuccessRef.current = onSuccess;

        if (!launch) {
            lastKeyRef.current = null;
            lastSentKeyRef.current = null;
            inFlightRef.current = false;
            return;
        }

        if (tiles.size) {
            execute();
        }
    }, [onSuccess, launch, tiles, execute]);
};

export { useMapDraw };
