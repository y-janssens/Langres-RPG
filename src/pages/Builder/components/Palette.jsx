import { useCallback, useMemo } from 'react';
import { useTranslation } from 'react-i18next';

import { Divider, Range } from 'react-daisyui';

import { Toggle } from './Toggle';
import { MenuItem } from './SideBar';

import css from '../builder.module.css';

export const Palette = ({ form, setForm }) => {
    const { t } = useTranslation();

    const disabled = useMemo(() => {
        if (!form.drawingMode.object) return true;

        return !form.drawingMode.object?.settings?.supports_density;
    }, [form.drawingMode.object]);

    const handleToggle = useCallback(
        (it) => {
            const object = !form.drawingMode.object || form.drawingMode.object.name !== it.name ? it : null;
            setForm('drawingMode', (prev) => ({ ...prev, object, density: object.default_density ?? prev.density, size: object.default_size }));
        },
        [form.drawingMode]
    );

    if (!form.drawingMode.toggle) {
        return null;
    }

    return (
        <div className={css[`builder-palette-container-${form.drawingMode.toggle ? 'active' : 'reduced'}`]}>
            <div className={css['builder-palette-brushes']}>
                {form.brushes.map((it) => (
                    <MenuItem
                        size="lg"
                        key={it.name}
                        icon={it.name}
                        label={t(`builder.menu.objects.${it.name}`)}
                        datatype={form.drawingMode.toggle && form.drawingMode.object?.name === it.name ? 'active' : ''}
                        onClick={() => handleToggle(it)}
                        active={form.drawingMode.toggle && form.drawingMode.object?.name === it.name}
                    />
                ))}
            </div>
            <Divider horizontal />
            <div className={css['builder-palette-settings']}>
                <div className={css['builder-palette-settings-item']}>
                    <span>{t('builder.palette.size')}</span>
                    <Range
                        dataTheme="business"
                        size="xs"
                        color="primary"
                        value={form.drawingMode.size}
                        onChange={({ target: { value } }) => setForm('drawingMode', (prev) => ({ ...prev, size: value }))}
                    />
                </div>
                <div className={css['builder-palette-settings-item']}>
                    <span>{t('builder.palette.density')}</span>
                    <Range
                        dataTheme="business"
                        size="xs"
                        color="primary"
                        disabled={disabled}
                        value={form.drawingMode.density}
                        onChange={({ target: { value } }) => setForm('drawingMode', (prev) => ({ ...prev, density: Number(value) }))}
                        style={{
                            cursor: disabled ? 'not-allowed' : 'initial',
                            opacity: disabled ? '0.5' : 1,
                            filter: disabled ? 'grayscale(1)' : 'unset'
                        }}
                    />
                </div>
                <div className={css['builder-palette-settings-item']}>
                    <span>{t('builder.palette.overwrite')}</span>
                    <Toggle active={form.drawingMode.overwrite} onChange={({ target: { checked } }) => setForm('drawingMode', (prev) => ({ ...prev, overwrite: checked }))} />
                </div>
            </div>
        </div>
    );
};
