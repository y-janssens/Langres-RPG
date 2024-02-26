import { Inventory } from './';
export default class Character {
    constructor({ name, _end, _for, _hab, _cha, _int, _ini, _pv, xp, gold, max_xp, lvl, inventory }) {
        this.name = name;
        this._end = _end;
        this._for = _for;
        this._hab = _hab;
        this._cha = _cha;
        this._int = _int;
        this._ini = _ini;
        this._pv = _pv;
        this.xp = xp;
        this.gold = gold;
        this.max_xp = max_xp;
        this.lvl = lvl;
        this.inventory = new Inventory(inventory);
    }

    compute_xp(xp) {
        const new_xp = this.xp + xp;
        const max_xp = this.max_xp;
        if (new_xp >= max_xp) {
            return this.level_up(new_xp - max_xp);
        }
        return (this.xp = parseInt(new_xp));
    }

    level_up(xp) {
        const max_xp = this.get_max_xp();
        this.max_xp = max_xp;
        this.lvl += 1;
        if (xp >= max_xp) {
            return this.compute_xp(this.xp + xp - max_xp);
        }
        return (this.xp = xp);
    }

    get_max_xp() {
        return Math.round(150 + (this.lvl * 100) / 3);
    }
}

// const handleXp = useCallback(() => {
//   let char = new Character(form.character);
//   char.compute_xp(153);
//   setFormObject({ ...form, character: char });
// }, [form, form.character, setFormObject]);
