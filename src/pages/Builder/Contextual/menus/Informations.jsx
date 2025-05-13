import { useTranslation } from 'react-i18next';
import { ContextualMenuWrapper } from '../Wrapper';

const Informations = ({ type, value, onClose }) => {
    const { t } = useTranslation();
    return (
        <ContextualMenuWrapper title={t(`builder.contextual.${type}`)} onClose={onClose}>
            <pre>{JSON.stringify(value, null, 4).replaceAll('"', '')}</pre>
        </ContextualMenuWrapper>
    );
};

export default Informations;
