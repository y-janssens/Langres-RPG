const TileInfo = ({ form, formKey, text }) => {
    return (
        <span
            style={{
                visibility: !form[formKey] && 'hidden'
            }}
        >
            {text}
        </span>
    );
};
export default TileInfo;
