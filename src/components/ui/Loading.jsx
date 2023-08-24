import css from "./ui.module.css";
export const Loading = ({
  loading = false,
  children = null,
  height = "100%"
}) => {
  if (loading) {
    return (
      <div className={css["loading-container"]} style={{ height: height }}>
        <div className={css["loading-spinner"]}></div>
        <div className={css["loading-background"]}></div>
        <span>Loading...</span>
      </div>
    );
  }
  return children;
};
