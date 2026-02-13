import { useTranslation } from 'react-i18next';

import { Divider } from 'react-daisyui';

import { MenuItem } from './SideBar';

import css from '../builder.module.css';

export const Palette = ({ form, setForm }) => {
    const { t } = useTranslation();

    if (!form.drawingMode.toggle) {
        return null;
    }

    return (
        <div className={css['builder-palette-container']} datatype={!form.drawingMode.toggle ? 'reduced' : ''}>
            <div className={css['builder-palette-brushes']}>
                {form.brushes.map((it, index) => (
                    <MenuItem
                        size="lg"
                        key={index}
                        icon={it.name}
                        label={t(`builder.menu.objects.${it.name}`)}
                        onClick={() => setForm('drawingMode', { ...form.drawingMode, object: it })}
                        active={form.drawingMode.toggle && form.drawingMode.object?.name === it.name}
                    />
                ))}
            </div>
            <Divider horizontal />
            <div className={css['builder-palette-settings']}>
                <span>settings</span>
            </div>
        </div>
    );
};
