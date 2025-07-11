use diesel::result::Error as ResultError;
use diesel::SqliteConnection;
use serde::{Deserialize, Serialize};
use std::io::Error;

use super::objects::Object;
use super::settings::Settings;
use super::types::{BattleState, Operator};
use super::{actions::Action, logs::BattleLog};
use crate::backend::settings::variables::BATTLE_SYSTEM_HISTORY_LENGTH;
use crate::battle::alterations::Alterations;
use crate::battle::cta::ActiveTimeBattle;
use crate::battle::datas::SystemDatas;
use crate::{character::models::Character, npcs::models::Npc};

#[derive(Debug, Serialize, Deserialize)]
pub struct BattleSystem {
    pub npc: Npc,                   // Npc instance
    pub current_turn: u8,           // Current turn
    pub current_operator: Operator, // Current operator
    pub state: BattleState,         // Battle status
    pub settings: Settings,         // Core settings
    pub alterations: Alterations,   // Characters status alterations
    pub character: Character,       // Character instance
    pub result: Option<Operator>,   // Battle winner
    pub history: Vec<BattleLog>,    // Battle history logs
    pub cta: ActiveTimeBattle,      // Active Time Battle frame !! EXPERIMENTAL !!
    pub datas: SystemDatas,         // Battle system serialized datas
}

impl BattleSystem {
    /// Initialize Battle System with default values
    pub fn initialize(
        character: Character,
        npc: Npc,
        connection: &mut SqliteConnection,
    ) -> Result<Self, ResultError> {
        Ok(Self {
            npc,
            result: None,
            current_turn: 0,
            datas: SystemDatas::get(&character),
            current_operator: Operator::default(),
            character: character.clone(),
            state: BattleState::default(),
            cta: ActiveTimeBattle::init(),
            alterations: Alterations::default(),
            settings: Settings::initialize(connection)?,
            history: Vec::with_capacity(BATTLE_SYSTEM_HISTORY_LENGTH),
        })
    }

    /// Setup Battle system for different starting entry points
    fn setup(&mut self) -> Result<(), Error> {
        self.validate_transition_state()?;
        self.current_turn += 1;
        self.increment_history(BattleLog::turn_log(&self.current_turn));
        self.cta.pre_allocate(self.current_operator);
        Ok(())
    }

    /// Start battle with an initiative roll
    pub fn start_default(&mut self) -> Result<&mut Self, Error> {
        self.setup()?;
        Action::Init.trigger(self)?;
        Ok(self)
    }

    /// Start battle on auto mode
    pub fn start_auto(&mut self) -> Result<&mut Self, Error> {
        self.setup()?;

        while self.state != BattleState::Ended {
            self.trigger_opponent_action("attack")?;
        }
        Ok(self)
    }

    /// Shoot first, ask questions later
    pub fn start_range(&mut self) -> Result<&mut Self, Error> {
        self.setup()?;
        self.trigger_opponent_action("shoot")?;
        Ok(self)
    }

    /// Start battle and engage immediately
    pub fn start_initiative(&mut self) -> Result<&mut Self, Error> {
        self.setup()?;
        Ok(self)
    }

    /// End battle
    pub fn end(&mut self) -> Result<&mut BattleSystem, Error> {
        self.get_result();
        self.validate_transition_state()?;
        Ok(self)
    }

    /// Takes a registered action string which will resolve itself and perform subsequent rolls and actions
    pub fn trigger_player_action(&mut self, action_string: &str) -> Result<(), Error> {
        self.battle_event(|battle| {
            battle.identify_battle_logs();
            let action = Action::resolve(action_string)?;
            Operator::reset(battle);
            action.trigger(battle)
        })
        .and_then(|_| self.trigger_counter_action())
    }

    /// Takes a registered object string which will resolve and trigger itself
    pub fn trigger_player_object(&mut self, object_string: &str) -> Result<(), Error> {
        self.battle_event(|battle| {
            battle.identify_battle_logs();
            let object = Object::resolve(object_string)?;
            Operator::reset(battle);
            object.trigger(battle)
        })
        .and_then(|_| self.trigger_counter_action())
    }

    /// Takes a registered action string which will resolve and trigger itself
    pub fn trigger_opponent_action(&mut self, action_string: &str) -> Result<(), Error> {
        self.battle_event(|battle| {
            let action = Action::resolve(action_string)?;
            battle.current_operator.switch_operator();
            action.trigger(battle)
        })
    }

    /// Automatic response from previous action
    fn trigger_counter_action(&mut self) -> Result<(), Error> {
        if self.state.is_valid() {
            self.battle_event(|battle| {
                let action = Action::resolve(&Action::Attack.to_string())?;
                if battle.current_operator != Operator::Npc {
                    battle.current_operator.switch_operator();
                }
                action.trigger(battle)
            })?;
        }
        self.update_datas()?;
        Ok(())
    }

    /// Handler which performs and validates battle events
    fn battle_event<T>(&mut self, event: T) -> Result<(), Error>
    where
        T: FnOnce(&mut Self) -> Result<(), Error>,
    {
        self.state.validate()?;

        event(self)?;

        self.check_battle_status()
    }

    /// Parse history and ensure it's length doesn't go beyond 200
    pub fn increment_history(&mut self, log: BattleLog) {
        self.cta.allocate(&log);

        if self.history.len() == BATTLE_SYSTEM_HISTORY_LENGTH {
            self.history.remove(0);
        }
        self.history.push(log);
    }

    /// If no remaining AP for both Character and Npc, reset values and start new turn
    /// If one opponent has lost all its pvs, end the battle
    fn check_battle_status(&mut self) -> Result<(), Error> {
        if self.character.pv == 0 || self.npc.pv == 0 {
            if self.state != BattleState::Ended {
                self.end()?;
            }
            return Ok(());
        }

        if self.character.ap < 1 && self.npc.ap < 1 {
            self.current_turn += 1;
            self.reset_state();
            self.increment_history(BattleLog::turn_log(&self.current_turn));
            Action::Init.trigger(self)?;
        }
        Ok(())
    }

    /// Update serialized system datas, actions and objects availability
    fn update_datas(&mut self) -> Result<(), Error> {
        self.datas = SystemDatas::get(&self.character);
        Ok(())
    }

    /// Mark previous logs as identified
    fn identify_battle_logs(&mut self) {
        self.history
            .iter_mut()
            .for_each(|log| log.identified = true);
    }

    /// Validate BattleState transition and log into system
    fn validate_transition_state(&mut self) -> Result<(), Error> {
        self.state.transition()?;
        let log = BattleLog::state_log(self);
        self.increment_history(log);
        Ok(())
    }

    /// Reset state upon each new turn
    fn reset_state(&mut self) {
        self.character.reset_ap();
        self.npc.reset_ap();
        self.current_operator = Operator::default();
    }

    /// Parse battle winner
    fn get_result(&mut self) {
        self.result = if self.character.pv < 1 {
            Some(Operator::Npc)
        } else if self.npc.pv < 1 {
            Some(Operator::Character)
        } else {
            None
        }
    }

    /// Admin only debugging output
    pub fn debug(&self) {
        if !self.settings.debug {
            return;
        }
        if !self.history.is_empty() {
            println!();
            for log in &self.history {
                if log.event.contains("Turn") {
                    println!();
                    println!("{}", log);
                    println!();
                } else {
                    println!("{}", log);
                }
            }
        }
        println!(
            "Character: Pvs: {} Aps: {}",
            self.character.pv, self.character.ap,
        );
        println!("Npc: Pvs: {} Aps: {}", self.npc.pv, self.npc.ap,);
    }
}
