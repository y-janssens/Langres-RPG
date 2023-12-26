import { useRef, memo, useEffect, useState, useCallback, useMemo } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGameContext } from '../../../hooks';
import { Tiles } from '../Scene/Tiles';
import Character from '../Character';
import Zombie from '../Ennemies/Zombie';

export const MapLayout = memo(({ form, position, characterRef, cameraRef, lightRef, handleGateWay }) => {
    const [context, setContext] = useGameContext();
    const [isInitialized, setIsInitialized] = useState(false);

    const directions = useMemo(() => {
        return context.controls.directions;
    }, [context]);

    const computePositions = useCallback(() => {
        const character = characterRef.current.position;
        cameraRef.current.object.position.set(Math.max(-44, Math.min(-4.5, character.x)), 15, Math.max(-62, Math.min(-25, character.z - 18)));
        lightRef.current.position.set(character.x, 10, character.z);
        context.controls.setPosition({ x: character.x, z: character.z });

        if (context.controls.getDelta(character)) {
            context.controls.setCamera(character);
            setContext({ controls: context.controls });
        }
    }, [cameraRef, lightRef, context, characterRef]);

    useFrame(() => {
        if (isInitialized) {
            const character = characterRef.current.position;

            if (context.controls.moving) {
                const adjustedX = Math.abs(character.x) + (directions.right ? context.controls.threshold : directions.left ? -context.controls.threshold : 0);
                const adjustedZ = Math.abs(character.z) + (directions.down ? context.controls.threshold : directions.up ? -context.controls.threshold : 0);
                const actualTile = context.world.content.find((tile) => tile.x === Math.ceil(adjustedX - 0.5) && tile.y === Math.ceil(adjustedZ - 0.5));

                const nextItems = {
                    xplus: context.world.content.find((tile) => tile.x === actualTile.x - 1 && tile.y === actualTile.y),
                    xminus: context.world.content.find((tile) => tile.x === actualTile.x + 1 && tile.y === actualTile.y),
                    zplus: context.world.content.find((tile) => tile.x === actualTile.x && tile.y === actualTile.y - 1),
                    zminus: context.world.content.find((tile) => tile.x === actualTile.x && tile.y === actualTile.y + 1)
                };

                switch (true) {
                    case directions.up:
                        if (actualTile?.walkable || (nextItems.zplus?.walkable && Math.abs(character.z) < actualTile.y)) {
                            character.z += 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(-Math.PI / 2, 0, Math.PI);
                        break;

                    case directions.down:
                        if (actualTile?.walkable || (nextItems.zminus?.walkable && Math.abs(character.z) >= actualTile.y)) {
                            character.z -= 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI);
                        break;

                    case directions.left:
                        if (actualTile?.walkable || (nextItems.xplus?.walkable && Math.abs(character.x) < actualTile.x)) {
                            character.x += 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, -Math.PI / 2);
                        break;

                    case directions.right:
                        if (actualTile?.walkable || (nextItems.xminus?.walkable && Math.abs(character.x) >= actualTile.x)) {
                            character.x -= 0.015 * context.controls.speed;
                        }
                        characterRef.current.rotation.set(Math.PI / 2, 0, Math.PI / 2);
                        break;
                }
                if (Boolean(actualTile?.threshold) && Object.keys(actualTile?.threshold).length) {
                    handleGateWay(actualTile.threshold);
                }
            }
            computePositions();
        }
    });

    useEffect(() => {
        if (cameraRef.current && characterRef && lightRef.current && !isInitialized) {
            setIsInitialized(true);
        }
    }, [isInitialized]);

    return (
        <>
            <Character position={position} characterRef={characterRef} />
            {/* <Zombies target={characterRef} map={form.world} nodes={form.world.grid} /> */}
            <Tiles data={form.world.content} form={form} characterRef={characterRef} cameraRef={cameraRef} />
        </>
    );
});

const Zombies = ({ target, map, nodes }) => {
    const refs = Array.from({ length: 1 }, (_, index) => useRef()); // eslint-disable-line

    return refs.map((ref, index) => {
        return <Zombie key={index} index={index} zombieRef={ref} target={target} map={map} nodes={nodes} />;
    });
};
