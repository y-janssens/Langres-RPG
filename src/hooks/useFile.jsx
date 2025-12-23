import { writeTextFile, BaseDirectory } from '@tauri-apps/plugin-fs';
import { downloadDir } from '@tauri-apps/api/path';

import { Trans } from 'react-i18next';
import { Toast } from './useToast';

class FileUtils {
    constructor(datas, extension, name) {
        this.name = name;
        this.datas = datas;
        this.extension = extension;
        this.toast = new Toast();
    }

    get date() {
        return new Date().toISOString().split('T')[0].replaceAll('-', '_');
    }

    get filename() {
        return `export_${this.name}_${this.date}.${this.extension}`;
    }

    async download() {
        const path = `${await downloadDir()}/${this.filename}`;

        return await writeTextFile(this.filename, this.datas, {
            baseDir: BaseDirectory.Download
        })
            .then(() => this.toast.info(<Trans i18nKey={'builder.toasts.export'} values={{ path }} />))
            .catch(() => this.toast.error(<Trans i18nKey={'builder.toasts.export_error'} />));
    }

    async copy() {
        return await navigator.clipboard
            .writeText(this.datas)
            .then(() => this.toast.info(<Trans i18nKey={'builder.toasts.copy'} />))
            .catch(() => this.toast.error(<Trans i18nKey={'builder.toasts.copy_error'} />));
    }
}

export const useDownload = async ({ datas, extension, name }) => await new FileUtils(datas, extension, name).download();
export const useClipBoard = async ({ datas, extension, name }) => await new FileUtils(datas, extension, name).copy();
