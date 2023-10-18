export default class BuilderState {
    constructor() {
        this.items = [];
        (this.functions = []), (this.defaultForm = {});
        this.storyline = {};
        this.init();
    }

    init() {
        this.items = [
            { id: 0, icon: 'clear', value: '-' },
            { id: 1, icon: 'tree', value: 'F' },
            { id: 2, icon: 'tree', value: 'T' },
            { id: 3, icon: 'rock', value: 'R' },
            { id: 4, icon: 'water', value: 'W' },
            { id: 5, icon: 'bridge', value: 'BR' }
        ];
        this.functions = [
            { id: 0, icon: 'trees', label: 'Generate Trees', command: 'populate_trees' },
            { id: 1, icon: 'clear', label: 'Clear Map', command: 'regenerate' }
        ];
        this.defaultForm = {
            mode: true,
            selectedMap: 'default',
            selectedAct: null,
            modalNew: false,
            selectedItem: null,
            selectedTiles: [],
            showValues: true,
            showIds: false,
            showObjects: false,
            showIcons: false,
            world: null
        };
    }
}
