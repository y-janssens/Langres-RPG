import React from "react";
import { Gauge, XpGauge } from "../../ui/Gauge";
import css from "./char-infos.module.css";

export const CharInfos = ({ character }) => {
  return (
    <div className={css["character-infos-container"]}>
      <div
        className={css["character-infos-border"]}
        onClick={() => console.log("test")}
      />
      <div className={css["character-infos-bubble"]} />
      <div className={css["character-infos-header"]}>
        <div>{character.name}</div>
        <Gauge stat={character._pv} max={character._pv} type={"pv"} />
        <XpGauge stat={character.xp} max={character.max_xp} />
      </div>
    </div>
  );
};
