import React, { useCallback, useEffect, useMemo } from 'react';
import { invoke } from '@tauri-apps/api/core';
import { useTranslation } from 'react-i18next';
import { useOutsideClick } from '../../../../hooks';

import css from '../contextual.module.css';

const Menu = ({ form, items, value, handleSwitch, onClose, sync }) => {
    const { t } = useTranslation();
    const ref = useOutsideClick(onClose);

    const handleClick = useCallback(
        async (item) => {
            if (!item.component) {
                await invoke(item.command, { actId: form.selectedAct.id, mapId: form.selectedMap.id, tiles: [value.id] }).then(() => {
                    sync();
                });
            } else {
                handleSwitch(item.type);
            }
        },
        [value, handleSwitch]
    );

    const position = useMemo(() => {
        const width = ref.current?.offsetWidth || 250;
        const height = ref.current?.offsetHeight || 132;
        const screenWidth = window.innerWidth;
        const screenHeight = window.innerHeight;
        const y = form.contextual.position.y || 0;
        const x = form.contextual.position.x || 0;

        const top = Math.max(0, y + height > screenHeight ? screenHeight - height : y - height / 2);
        const left = Math.max(0, x + width > screenWidth ? screenWidth - width : x);

        return { top, left };
    }, [form.contextual.position, ref.current?.offsetHeight, ref.current?.offsetWidth]);

    useEffect(() => {
        if (ref.current) {
            ref.current.focus();
        }
    }, [ref.current]);

    return (
        <div className={css['contextual-base-menu']} ref={ref} style={{ ...position }}>
            {items.map((item, index) => {
                const disabled = item.deleteItem && !form.selectedMap.npcs.some((it) => it.starting_point.id === value.id);
                const dataType = item.deleteItem ? 'delete' : '';
                if (disabled) return null;
                return (
                    <div key={index} className={css['contextual-base-menu-item']} datatype={dataType} onClick={() => handleClick(item)}>
                        <span>{t(`builder.contextual.${item.type}`)}</span>
                    </div>
                );
            })}
        </div>
    );
};

export default Menu;
