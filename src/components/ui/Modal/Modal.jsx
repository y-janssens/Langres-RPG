import { Loading } from '../Loading';
import { ModalButton } from './ModalButton';
import css from '../ui.module.css';

function Modal({ children, height = '400px', name, loading, onClick, disabled = false }) {
    return (
        <div
            className={css['modal']}
            style={{
                height
            }}
        >
            <div className={css['modal-body']}>
                <Loading loading={loading}>{children}</Loading>
                <ModalButton name={name} onClick={onClick} disabled={disabled} />
            </div>
        </div>
    );
}

export default Modal;
