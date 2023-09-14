import { useCallback, useState } from 'react';
import useGameContext from '../../../hooks/useGameContext';
import { Loading } from '../../ui/Loading';
import { SavedGame } from './SavedGame';
import { MenuItem } from '../MenuItem';

import css from './modal.module.css';
import { ModalButton } from './ModalButton';

export const Modal = ({ height = '400px', name = null, loading = false, items = [], state = null, onClose = () => {}, onClick = () => {}, sync = () => {} }) => {
    const [, setContext] = useGameContext();
    const [playerName, setPlayerName] = useState('');
    const [selectedItem, setSelectedItem] = useState(null);

    const handleLoad = useCallback(() => {
        if (selectedItem) {
            setContext({ gameId: selectedItem });
            onClose();
        }
    }, [selectedItem, onclose]);

    if (state !== name || loading) {
        return null;
    }

    if (name === 'new_game') {
        return (
            <div
                className={css['modal']}
                style={{
                    height: '250px'
                }}
            >
                <div className={css['modal-body']}>
                    <div className={css['new-game-input']}>
                        <input type="text" placeholder="Enter player name" value={playerName} onChange={(e) => setPlayerName(e.target.value)} />
                    </div>
                    <MenuItem className="menu-item-modal" name={'Start'} onClick={() => onClick(playerName)} disabled={!playerName.length} />
                </div>
            </div>
        );
    }

    return (
        <div
            className={css['modal']}
            style={{
                height
            }}
        >
            <div className={css['modal-body']}>
                <Loading loading={loading}>
                    {items?.map((save) => {
                        return <SavedGame selected={selectedItem} setSelected={setSelectedItem} key={save.id} item={save} onLoad={sync} />;
                    })}
                </Loading>
                <ModalButton name={'Start'} onClick={handleLoad} disabled={!selectedItem} />
            </div>
        </div>
    );
};
