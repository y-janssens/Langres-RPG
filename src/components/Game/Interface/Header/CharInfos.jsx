import { useCallback } from "react";
import { Gauge, XpGauge } from "../../../ui/Gauge";
import css from "./char-infos.module.css";
import { GameModel } from "../../../../models";

export const CharInfos = ({ game, character, sync }) => {
  const handleRegenerate = useCallback(() => {
    let _game = new GameModel(game);
    _game.regenrate_world();
    sync();
  }, [game, sync]);
  return (
    <div className={css["character-infos-container"]}>
      <div
        className={css["character-infos-border"]}
        onClick={handleRegenerate}
      />
      <div className={css["character-infos-level"]}>{character.lvl}</div>
      <div className={css["character-infos-bubble"]} />
      <div className={css["character-infos-header"]}>
        {/* <div>{character.name}</div> */}
        <Gauge stat={character._pv} max={character._pv} type={"pv"} />
        <XpGauge stat={character.xp} max={character.max_xp} />
      </div>
    </div>
  );
};
