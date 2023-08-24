import css from "./ui.module.css";

export const Close = ({ onClick = () => {} }) => {
  return (
    <div className={css["close-button"]} onClick={onClick}>
      X
    </div>
  );
};
