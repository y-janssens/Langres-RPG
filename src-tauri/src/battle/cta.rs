use serde::{Deserialize, Serialize};
use std::ops::{Deref, DerefMut};

use crate::{
    backend::settings::variables::BATTLE_SYSTEM_CTA_LENGTH,
    battle::{logs::BattleLog, types::Operator},
};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Entry {
    pub operator: Operator,
    pub temporary: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActiveTimeBattle(pub Vec<Entry>);

impl Deref for ActiveTimeBattle {
    type Target = Vec<Entry>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for ActiveTimeBattle {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl ActiveTimeBattle {
    pub fn init() -> Self {
        Self(Vec::new())
    }

    pub fn evaluate(&mut self, operator: Operator) -> Self {
        let mut atb = self.clone();
        let current = operator.get_opponent();

        atb.purge();
        atb.push(Entry {
            operator: current,
            temporary: false,
        });
        for i in 0..BATTLE_SYSTEM_CTA_LENGTH - 1 {
            if i % 2 == 0 {
                atb.push(Entry {
                    operator: current.get_opponent(),
                    temporary: true,
                });
            } else {
                atb.push(Entry {
                    operator: current,
                    temporary: true,
                });
            }
        }
        atb
    }

    pub fn pre_allocate(&mut self, current: Operator) {
        let atb = self.evaluate(current);
        *self = atb;
    }

    pub fn allocate(&mut self, log: &BattleLog) {
        let current = self.get_next(log);
        let atb = self.evaluate(current);
        *self = atb;
    }

    fn get_next(&mut self, log: &BattleLog) -> Operator {
        if let Some(action) = &log.action {
            match action.is_defensive() {
                true => log.initiator.get_opponent(),
                false => log.initiator,
            }
        } else {
            log.initiator
        }
    }

    fn purge(&mut self) {
        if !self.is_empty() {
            self.clear();
        }
    }
}
