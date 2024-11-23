import { Loading } from './Loading';
import { Button } from './Button';
import css from './ui.module.css';

function Modal({ children, height = '400px', name, loading = false, onClick, disabled = false }) {
    return (
        <div
            className={css['modal']}
            style={{
                height
            }}
        >
            <div className={css['modal-body']}>
                <Loading loading={loading}>{children}</Loading>
                <Button modal name={name} onClick={onClick} disabled={disabled} />
            </div>
        </div>
    );
}

export default Modal;
