import React from 'react';

export default function useFirstRender() {
    // Symbol is different at each render
    const isFirstRun = Symbol();
    // .current is the Symbol generated at the first render
    // all subsequent renders will have a different Symbol
    return React.useRef(isFirstRun).current === isFirstRun;
}
