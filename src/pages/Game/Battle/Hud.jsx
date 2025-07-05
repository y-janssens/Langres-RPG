import { useCallback, useState } from 'react';

import { BattleHistory, BattleItem } from './components';

import css from './battle.module.css';

const Hud = ({ battle, setBattle }) => {
    const [currentItem, setCurrentItem] = useState('skills');

    const handleAttack = useCallback(() => {
        battle.attack().then((resp) => {
            setBattle(resp);
        });
    }, [battle]);

    const handleFlee = useCallback(() => {
        battle.flee().then((resp) => {
            setBattle(resp);
        });
    }, [battle]);

    const handleAction = useCallback(
        (action) => {
            action.trigger(battle).then((resp) => {
                setBattle(resp);
            });
        },
        [battle]
    );

    const handleObject = useCallback(
        (object) => {
            object.trigger(battle).then((resp) => {
                setBattle(resp);
            });
        },
        [battle]
    );

    return (
        <div className={css['battle-hud']}>
            <div className={css['battle-hud-bottom']}>
                <div className={css['battle-hud-actions']}>
                    <BattleItem label="Attack" handleClick={handleAttack} />
                    <BattleItem label="Skills" currentItem={currentItem} setCurrentItem={setCurrentItem} items={battle?.actions} handleClick={handleAction} />
                    <BattleItem label="Objects" currentItem={currentItem} setCurrentItem={setCurrentItem} items={battle?.objects} handleClick={handleObject} />
                    <BattleItem label="Flee" handleClick={handleFlee} />
                </div>
                <BattleHistory history={battle?.history} />
            </div>
        </div>
    );
};

export default Hud;
