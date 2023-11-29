import React from 'react';
import { CharInfos } from './Header/CharInfos';
import { Character } from '../Interface/Character/Character';
import { Map } from '../Interface/Map/Map'; // eslint-disable-line
import MiniMap from './Minimap/MiniMap'; // eslint-disable-line

export const Hud = ({ game, display, position, context }) => {
    if (!display.interface) {
        return null;
    }
    return (
        <>
            <CharInfos character={game.character} />
            {/* <Map display={display.map} position={position} context={context} /> */}
            <Character display={display.character} character={game.character} />
            {/* <MiniMap position={position} context={context} /> */}
        </>
    );
};
