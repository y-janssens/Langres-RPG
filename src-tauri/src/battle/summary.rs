use serde::{Deserialize, Serialize};

use crate::battle::{
    actions::Action,
    logs::{BattleLog, LogType},
    types::Operator,
};

#[derive(Clone, Copy, Debug, Serialize, PartialEq, Deserialize, Default)]
pub struct Summary {
    pub turns: i32,
    pub max_damages: i32,
    pub damages_inflicted: i32,
    pub damages_received: i32,
    pub heal_received: i32,
    pub objects_used: i32,
    pub successful_parries: i32,
    pub successful_dodges: i32,
}

impl Summary {
    pub fn compute(&mut self, history: &[BattleLog]) -> Self {
        let npc = Operator::Npc;
        let character = Operator::Character;

        let total_damages: Vec<i32> = self.compute_damages(history, npc).collect();

        self.turns = self.compute_turns(history);
        self.damages_inflicted = total_damages.iter().sum();
        self.objects_used = self.compute_objects(history, character);
        self.max_damages = total_damages.into_iter().max().unwrap_or(0);
        self.heal_received = self.compute_healing(history, character);
        self.damages_received = self.compute_damages(history, character).sum();
        self.successful_dodges = self.compute_actions(history, Action::Dodge, character);
        self.successful_parries = self.compute_actions(history, Action::Parry, character);

        *self
    }

    fn compute_damages<'a>(&self, history: &'a [BattleLog], operator: Operator) -> impl Iterator<Item = i32> + 'a {
        let operator_str = operator.to_string();

        history
            .iter()
            .filter(move |log| log.r#type == LogType::Damage && log.text.to_lowercase().contains(&operator_str))
            .map(|log| log.value.unwrap_or(0))
    }

    fn compute_actions(&self, history: &[BattleLog], action: Action, initiator: Operator) -> i32 {
        history
            .iter()
            .filter(|log| log.action == Some(action) && log.initiator == initiator)
            .count() as i32
    }

    fn compute_healing(&self, history: &[BattleLog], initiator: Operator) -> i32 {
        history
            .iter()
            .filter(|log| log.r#type == LogType::Heal && log.text.contains(&initiator.to_string()))
            .map(|log| log.value.unwrap_or(0))
            .sum()
    }

    fn compute_objects(&self, history: &[BattleLog], operator: Operator) -> i32 {
        history
            .iter()
            .filter(|log| log.r#type == LogType::Object && log.initiator == operator)
            .count() as i32
    }

    fn compute_turns(&self, history: &[BattleLog]) -> i32 {
        history
            .iter()
            .filter(|log| log.r#type == LogType::State && log.value.is_some())
            .map(|log| log.value.unwrap_or(0))
            .max()
            .unwrap_or(0)
    }
}
