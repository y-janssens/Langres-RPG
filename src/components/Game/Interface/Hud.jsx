import React from 'react';
import { CharInfos } from './Header/CharInfos';
import { Character } from '../Interface/Character/Character';
import { Map } from '../Interface/Map/Map';
import MiniMap from './Minimap/MiniMap';

export const Hud = ({ game, display, position, context, sync }) => {
    if (!display.interface) {
        return null;
    }
    return (
        <>
            <CharInfos character={game.character} />
            <Map display={display.map} position={position} context={context} sync={sync} />
            <Character display={display.character} character={game.character} />
            <MiniMap position={position} context={context} />
        </>
    );
};
