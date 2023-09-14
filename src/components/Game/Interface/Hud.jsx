import React from 'react';
import { CharInfos } from './Header/CharInfos';
import { Character } from '../Interface/Character/Character';
import { Inventory } from '../Interface/Inventory/Inventory';
import { Map } from '../Interface/Map/Map';
import MiniMap from './Minimap/MiniMap';

export const Hud = ({ game, display, position }) => {
    if (!display.interface) {
        return null;
    }
    return (
        <>
            <CharInfos character={game.character} />
            <Map display={display.map} />
            <Inventory display={display.inventory} />
            <Character display={display.character} character={game.character} />
            <MiniMap game={game} position={position} />
        </>
    );
};
