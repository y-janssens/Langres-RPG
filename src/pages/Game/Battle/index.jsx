import { useRef } from 'react';

import { useDynamicForm } from '../../../hooks/useDynamicForm';
import { BattleSystem } from '../../../models';

import { Canvas } from '@react-three/fiber';
import { Grid } from '@react-three/drei';

import { Loading } from '../../../components/Ui/Loading';
import Hud from './Hud';

import css from './battle.module.css';

const Battle = ({ form }) => {
    const gridRef = useRef();

    const [battle, , setBattle] = useDynamicForm({
        alterations: { character: 'Clear', npc: 'Clear' },
        current: 'System',
        datas: {
            actions: [],
            objects: [],
            alterations: []
        },
        cta: [],
        history: [],
        settings: {
            automatic: false,
            debug: false,
            difficulty: 'Normal',
            realtime: false,
            tampering: 'NoTamper'
        },
        result: null
    });

    const [, loadingBattle] = BattleSystem.useCommand(
        {
            payload: {
                character: form.character,
                npc: form.world?.npcs[0]
            },
            launch: Boolean(form.world && form.character),
            onSuccess: (response) => {
                setBattle(response);
            }
        },
        [form.world, form.character]
    );

    return (
        <div className={css['battle-container']}>
            <Loading loading={loadingBattle}>
                <div className={css['battle-scene']}>
                    <Canvas shadows camera={{ position: [10, 2, 10], fov: 25 }}>
                        <Grid ref={gridRef} args={[10, 10]} position={[0, -1, 0]} rotation={[0, Math.PI / 4, 0]} fadeDistance={25} />
                    </Canvas>
                </div>
                <Hud battle={battle} setBattle={setBattle} />
            </Loading>
        </div>
    );
};

export default Battle;
