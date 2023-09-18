#[allow(dead_code)]
pub mod character {

    use crate::classes::inventory::inventory::Inventory;
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Character {
        name: String,
        _end: u32,
        _for: u32,
        _hab: u32,
        _cha: u32,
        _int: u32,
        _ini: u32,
        _pv: u32,
        xp: u32,
        max_xp: u32,
        gold: u64,
        lvl: u32,
        inventory: Inventory,
    }

    impl Character {
        pub fn new() -> Character {
            Character {
                name: String::new(),
                _end: 8,
                _for: 8,
                _hab: 8,
                _cha: 8,
                _int: 8,
                _ini: 8,
                _pv: 60,
                xp: 0,
                max_xp: 150,
                gold: 10,
                lvl: 1,
                inventory: Inventory::new(),
            }
        }

        pub fn initiate(
            &mut self,
            name: String,
            _end: u32,
            _for: u32,
            _hab: u32,
            _cha: u32,
            _int: u32,
            _ini: u32,
            _pv: u32,
        ) {
            self.name = name;
            self._end = _end;
            self._for = _for;
            self._hab = _hab;
            self._cha = _cha;
            self._int = _int;
            self._ini = _ini;
            self._pv = _pv;
        }

        pub fn compute_xp(&mut self, xp: u32) {
            let new_xp = self.xp + xp;
            let max_xp = self.max_xp;
            if new_xp >= max_xp {
                return Self::level_up(self, new_xp - max_xp);
            }
            return self.xp = new_xp;
        }

        pub fn level_up(&mut self, xp: u32) {
            let max_xp: u32 = Self::get_max_xp(&self);
            self.max_xp = max_xp;
            self.lvl += 1;
            if xp >= max_xp {
                return Self::compute_xp(self, self.xp + xp - max_xp);
            }
            return self.xp = xp;
        }

        fn get_max_xp(&self) -> u32 {
            ((150 + (self.lvl * 100) / 3) as f64).round() as u32
        }
    }
}
