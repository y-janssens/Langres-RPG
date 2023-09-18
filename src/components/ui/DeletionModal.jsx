import { useCallback } from 'react';
import { GameModel } from '../../models';
import { useTranslation } from 'react-i18next';
import { Button } from './Button';
import css from './ui.module.css';

function DeletionModal({ gameToDelete, height = '200px', onLoad, onClose, disabled = false }) {
    const { t } = useTranslation();

    const handleDelete = useCallback(() => {
        const game = new GameModel(gameToDelete);
        game.delete().then(() => {
            onLoad();
            onClose();
        });
    }, [gameToDelete, onLoad, onClose]);

    if (!gameToDelete) {
        return null;
    }
    return (
        <div
            className={css['modal']}
            style={{
                height
            }}
        >
            <div className={css['modal-body']}>
                <div className={css['modal-body-message']}>
                    <span>{gameToDelete.player}</span>
                    <span>{t('menu.deletion-modal.header')}</span>
                    <span>{t('menu.deletion-modal.message')}</span>
                </div>
                <div className={css['modal-btns']}>
                    <Button name={t('actions.confirm')} onClick={handleDelete} disabled={disabled} />
                    <Button name={t('actions.cancel')} onClick={onClose} cancel />
                </div>
            </div>
        </div>
    );
}

export default DeletionModal;
