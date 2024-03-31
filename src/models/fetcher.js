import { useState, useCallback, useEffect } from 'react';
import { invoke } from '@tauri-apps/api';

export default class Fetcher {
    static resolveLauncher(params) {
        if (!('launch' in params)) {
            return true;
        }
        return Boolean(params.launch);
    }

    static defaultParams(params) {
        return {
            launch: this.resolveLauncher(params),
            useLoader: params.useLoader || false,
            id: params.id ? params.id : null,
            onSuccess: params.onSuccess || null,
            payload: params.payload || null
        };
    }

    static fromApi(id, data) {
        if (!id) {
            if (!Array.isArray(data)) {
                data = [data];
            }
            return data.map((it) => new this(it));
        }
        return new this(data);
    }

    static useCommand(params = {}, deps = []) {
        const [data, setData] = useState(null);
        const [loading, setLoading] = useState(false);

        const _params = this.defaultParams(params);

        const fetch = useCallback(async () => {
            if (_params.useLoader) {
                setLoading(true);
            }

            await invoke(this.command(_params.id), { id: _params.id, ..._params.payload })
                .then((response) => {
                    const parsedResponse = this.fromApi(_params.id, response);
                    setData(parsedResponse);
                    _params.onSuccess && _params.onSuccess(parsedResponse);
                })
                .catch((error) => {
                    console.error(error);
                })
                .finally(() => {
                    if (_params.useLoader) {
                        setLoading(false);
                    }
                });
        }, [_params]);

        useEffect(() => {
            if (_params.launch) {
                fetch();
            }
        }, [...deps]); // eslint-disable-line

        return [data, loading, fetch];
    }

    async new() {
        await invoke(`new_${this.model}`, this.payload());
    }

    async save(overide = false) { // eslint-disable-line
        await invoke(`save_${this.model}`, { id: this.id, data: this });
    }

    async delete() {
        await invoke(`delete_${this.model}`, { id: this.id });
    }
}
