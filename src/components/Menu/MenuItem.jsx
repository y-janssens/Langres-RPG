import css from "./menu.module.css";

export const MenuItem = ({ name, onClick = () => {} }) => {
  return (
    <div className={css["menu-item"]} onClick={onClick}>
      {name}
    </div>
  );
};
