import { toast as notification } from 'react-toastify';

class Toast {
    constructor() {
        this.args = {
            position: 'top-right',
            autoClose: 2000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: false,
            progress: undefined,
            theme: 'colored'
        };
    }

    info(message) {
        return notification.info(message, this.args);
    }
    success(message) {
        return notification.success(message, this.args);
    }
    warning(message) {
        return notification.warning(message, this.args);
    }
    error(message) {
        return notification.error(message, this.args);
    }
}

export const useToast = () => {
    const toast = new Toast();

    return toast;
};
