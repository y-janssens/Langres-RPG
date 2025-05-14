import { useRef, useMemo, useCallback } from 'react';
import { useDynamicForm, useGameContext, useTranslation } from '../../hooks';
import { GameModel, Environment, PlayerJournal } from '../../models';

import { Hud } from './Interface/Hud';
import { LoadingScreen, PauseScreen, OpeningTitle, InGameMenu } from '../../components';
import { MapLayout } from './MapLayout';
import { Scene } from './Scene';

export const Game = ({ keyToggles, pause, position, setPosition }) => {
    const { t } = useTranslation();
    const [engine, setEngine, removeFromEngine] = useGameContext();

    const cameraRef = useRef();
    const characterRef = useRef();
    const pointLightRef = useRef();

    const [form, setForm, setFormObject] = useDynamicForm({
        id: null,
        environment: {},
        loadingProgress: 0,
        loadingReady: false
    });

    const [game, loading, reload] = GameModel.useCommand(
        {
            useLoader: true,
            id: engine.gameId,
            launch: Boolean(engine.gameId || engine.mapId),
            onSuccess: (response) => {
                let game = new GameModel({ ...response, engine });
                const currentWorld = game.current_world;
                engine.controls.currentTile = game.current_tile;

                if (!game.has_position || engine.mapId) {
                    game.last_known_position = { ...game.last_known_position, x: currentWorld.starting_point.x, y: currentWorld.starting_point.y };
                }

                engine.controls.setPosition({ x: -game.last_known_position.x, z: -game.last_known_position.y });
                engine.controls.setCamera({ x: -game.last_known_position.x, z: -game.last_known_position.y });
                engine.controls.items = currentWorld.content;
                engine.world = currentWorld;

                setPosition(engine.controls.positions);
                setFormObject({ ...form, ...game, world: currentWorld, act: game.current_act, openingTitle: game.title });
                setEngineHotReload(game, reload);
            }
        },
        [engine.gameId, engine?.mapId]
    );

    const setEngineHotReload = useCallback(
        (game, reload) => {
            engine.settings.refreshGame = () => {
                if (!engine.mapId || engine.mapId?.is_final) {
                    game.last_known_position = { x: Math.abs(engine.controls.positions[0]), y: Math.abs(engine.controls.positions[2]), id: engine.controls.currentTile.id };
                }
                game.save();
                reload();
            };
        },
        [engine]
    );

    const handleGateWay = useCallback(
        (gateway) => {
            let game = new GameModel(form);
            if (gateway[0] && Boolean(gateway[1])) {
                let act = game.storyline.acts.find((act) => act.id === form.act.id);
                act.maps.find((mp) => mp.id === form.world.id).complete = true;
            }
            game.save().then(() => {
                if (form.world.primary) {
                    setEngine({ mapId: { id: gateway[0], is_final: gateway[1] } });
                } else {
                    removeFromEngine('mapId');
                }
                setFormObject({ ...form, loadingProgress: 0, loadingReady: false });
            });
        },
        [form]
    );

    PlayerJournal.useCommand(
        {
            useLoader: true,
            id: engine.gameId,
            launch: game,
            onSuccess: (response) => {
                setFormObject({ ...form, journal: response });
            }
        },
        [game]
    );

    Environment.useCommand(
        {
            launch: game,
            payload: { date: form.act?.date },
            onSuccess: (response) => {
                let environment = response;
                environment.season = t(`environment.seasons.${response.season}`);
                setForm('environment', environment);
            }
        },
        [game]
    );

    const contextReady = useMemo(() => {
        if (!engine) {
            return false;
        }
        const expectedKeys = ['controls', 'gameId', 'applicationData'];
        return Boolean(expectedKeys.every((key) => Object.prototype.hasOwnProperty.call(engine, key)));
    }, [engine]);

    const displayInGameMenu = useMemo(() => {
        return engine.gameId && engine.controls.toggles.menu;
    }, [engine, engine.controls]);

    const isLoading = useMemo(() => {
        return !form.id || loading || !contextReady;
    }, [form, loading, !contextReady]);

    return (
        <>
            {displayInGameMenu && <InGameMenu id={engine.gameId} form={form} />}
            <PauseScreen ready={contextReady} engine={engine} />
            <LoadingScreen form={form} setForm={setForm} engine={engine} loading={isLoading}>
                {form.loadingReady && <OpeningTitle title={form.openingTitle} environment={form.environment} />}
                <Hud engine={engine} game={form} display={keyToggles} />
                <Scene engine={engine} lightRef={pointLightRef} cameraRef={cameraRef} pause={pause}>
                    <MapLayout form={form} position={position} cameraRef={cameraRef} characterRef={characterRef} lightRef={pointLightRef} handleGateWay={handleGateWay} />
                </Scene>
            </LoadingScreen>
        </>
    );
};
