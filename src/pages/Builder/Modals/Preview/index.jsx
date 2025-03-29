import { BuilderModalWrapper } from '../Wrapper';
import { MapThumbnail } from '../Generator/Blocks';

import css from './preview.module.css';

const Collections = ({ type, value, onClose }) => {
    return (
        <BuilderModalWrapper onClose={onClose} canBeClosed type={type} displaySubtitle={false} displayFooter={false}>
            <div className={css['preview-modal-container']}>{<MapThumbnail map={value} size={4} />}</div>
        </BuilderModalWrapper>
    );
};
export default Collections;
