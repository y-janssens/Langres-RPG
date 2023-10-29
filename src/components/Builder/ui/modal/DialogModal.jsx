import { useCallback, useState, useMemo, useEffect } from 'react';
import { invoke } from '@tauri-apps/api/tauri';
import { Modal, Button, InputGroup, Input } from 'react-daisyui';
import css from './modal.module.css';

export const SettingsModal = ({
    open = false,
    onClose = () => {},
    sync = () => {},
    reset = () => {},
    title = 'Create and edit maps',
    storyline,
    footerValidLabel = 'Save',
    footerCancelLabel = 'Cancel',
    footerClearLabel = 'Reset'
}) => {
    const [openSelect, setOpenSelect] = useState(false);
    const [selectedAct, setSelectedAct] = useState(null);
    const [itemsCount, setItemsCount] = useState(1);
    const [storedDatas, setStoredDatas] = useState([{ name: '', size: '', order: 0 }]);

    const groups = useMemo(() => {
        return storyline?.story.acts.map((act) => act);
    }, [storyline]);

    const handleSelect = useCallback(
        (item) => {
            setSelectedAct(item);
            setOpenSelect(false);
            setItemsCount(1);
            // setStoredDatas([{ name: '', size: '', order: itemsCount + 1 }]);
        },
        [selectedAct, itemsCount]
    );

    const handleReset = useCallback(() => {
        setSelectedAct(null);
        sync();
    }, [sync]);

    const label = useMemo(() => {
        if (!selectedAct) {
            return 'Select an Act';
        }
        return `${selectedAct.name} - ${selectedAct.title}`;
    }, [selectedAct]);

    const handleAdd = useCallback(() => {
        const count = itemsCount + 1;
        let datas = [...storedDatas];
        datas.push({ name: '', size: '', order: itemsCount });
        setStoredDatas(datas);
        setItemsCount(count);
    }, [itemsCount, storedDatas]);

    const handleRemove = useCallback(() => {
        const count = itemsCount - 1;
        let datas = [...storedDatas];
        datas.pop();
        setStoredDatas(datas);
        setItemsCount(count);
    }, [itemsCount, storedDatas]);

    const handleChange = useCallback(
        (index, key, value) => {
            let datas = [...storedDatas];
            datas[index][key] = value;
            delete datas[index]['content'];
            setStoredDatas(datas);
        },
        [storedDatas, selectedAct]
    );

    const handleParse = useCallback(
        async (item) => {
            await invoke('generate', { name: item.name, size: parseInt(item.size), order: parseInt(item.order) })
                .then((data) => {
                    let act = storyline.story.acts.find((act) => act.id === selectedAct.id);
                    let maps = act.content.maps.filter((mp) => 'content' in mp && mp.order !== data.order);
                    maps.push(data);
                    act.content.maps = maps;
                })
                .finally(() => {
                    invoke('save_storyline', { data: storyline }).then(() => {
                        sync();
                        reset();
                    });
                });
        },
        [selectedAct, storyline, sync, reset]
    );

    const handleSave = useCallback(() => {
        let datas = storedDatas.filter((it) => Boolean(it.name && it.size && !it.content));
        for (let i = 0; i < datas.length; i++) {
            handleParse(datas[i]);
        }
    }, [storedDatas, handleParse]);

    useEffect(() => {
        if (selectedAct && itemsCount === 1) {
            let datas = { ...selectedAct };
            if (datas.content.maps.length) {
                datas.content.maps.push({ name: '', size: '', order: datas.content.maps.length });
                setStoredDatas(datas.content.maps);
                setItemsCount(datas.content.maps.length);
            }
        }
    }, [selectedAct, itemsCount]);

    if (!open) {
        return null;
    }

    return (
        <Modal.Legacy className={css['dialog-modal-body']} dataTheme="dracula" onClickBackdrop={onClose} open={open}>
            <Modal.Header className="font-bold">{title}</Modal.Header>
            <Modal.Body>
                <div className={css['dialog-modal-content']}>
                    <Button dataTheme="dracula" size="sm" color="neutral" fullWidth onClick={() => setOpenSelect(!openSelect)} animation={false}>
                        <div className={css['dialog-modal-select']}>
                            <span>{label}</span>
                            <span className={css['dialog-modal-chevron']}>{String.fromCharCode(openSelect ? '9650' : '9660')}</span>
                        </div>
                    </Button>
                    {openSelect && groups?.length && (
                        <div className={css['dialog-content']}>
                            <div className={css['dialog-sub-content']}>
                                {groups.map((gr, index) => {
                                    return (
                                        <Button key={index} className={css['dialog-modal-btn']} dataTheme="business" size="xs" color="primary" onClick={() => handleSelect(gr)}>
                                            <span>{`${gr.name} - ${gr.title}`}</span>
                                        </Button>
                                    );
                                })}
                            </div>
                        </div>
                    )}
                    {selectedAct &&
                        Array.from({ length: itemsCount }).map((_, index) => {
                            return (
                                <MapInput
                                    key={index}
                                    index={index}
                                    storedDatas={storedDatas}
                                    itemsCount={itemsCount}
                                    handleChange={handleChange}
                                    handleRemove={handleRemove}
                                    handleAdd={handleAdd}
                                />
                            );
                        })}
                </div>
            </Modal.Body>
            <div className={css['dialog-modal-footer']}>
                <Button
                    className={css['dialog-modal-footer-btn']}
                    dataTheme="dark"
                    size="sm"
                    color="neutral"
                    onClick={() => {
                        handleReset();
                        onClose();
                    }}
                >
                    {footerCancelLabel}
                </Button>
                <Button className={css['dialog-modal-footer-btn']} dataTheme="business" size="sm" color="secondary" onClick={handleReset}>
                    {footerClearLabel}
                </Button>
                <Button className={css['dialog-modal-footer-btn']} dataTheme="business" size="sm" color="primary" onClick={handleSave}>
                    {footerValidLabel}
                </Button>
            </div>
        </Modal.Legacy>
    );
};

const MapInput = ({ index, storedDatas, itemsCount, handleChange, handleRemove, handleAdd }) => {
    return (
        <div className={css['dialog-map-input']}>
            <InputGroup>
                <Input
                    className={css['dialog-map-input-text']}
                    dataTheme="dracula"
                    size="sm"
                    placeholder="Map name"
                    value={storedDatas[index].name || ''}
                    onChange={(e) => handleChange(index, 'name', e.target.value)}
                />
                <Input
                    className={css['dialog-map-input-number']}
                    dataTheme="dracula"
                    size="sm"
                    placeholder="Size"
                    value={storedDatas[index].size || ''}
                    onChange={(e) => handleChange(index, 'size', e.target.value)}
                />
                <Input
                    className={css['dialog-map-input-number']}
                    dataTheme="dracula"
                    size="sm"
                    placeholder="Order"
                    value={storedDatas[index].order}
                    onChange={(e) => handleChange(index, 'order', e.target.value)}
                />
                <Button
                    className={css['dialog-map-items-btn']}
                    dataTheme="dark"
                    size="sm"
                    color="default"
                    onClick={handleAdd}
                    disabled={!storedDatas[index].name || !storedDatas[index].size}
                >
                    +
                </Button>
                <Button
                    className={css['dialog-map-items-btn']}
                    size="sm"
                    color="neutral"
                    disabled={itemsCount === 1 || (itemsCount >= 1 && index !== itemsCount - 1)}
                    onClick={handleRemove}
                >
                    -
                </Button>
            </InputGroup>
        </div>
    );
};
