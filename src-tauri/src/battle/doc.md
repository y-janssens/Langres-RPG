# Battle System Documentation

## Overview

The battle system is a turn-based combat system that handles interactions between player and NPCs. It supports both real-time and turn-based combat modes, with an easy to use action system, logging, and combat tracking.

## Core Components

### Battle System (`models.rs`)

The main combat manager that handles the battle state and flow:

```rust
struct BattleSystem {
    npc: Npc,             // Npc instance
    ongoing: bool,        // Battle status
    realtime: bool,       // Real time or turn by turn battle, defined by system's variable
    current: Operator,     // Current turn
    history: Vec<BattleLog>,    // Shallow combat history, holds latest turns
    cta: Vec<Operator>,    // Turn based combat system shallow history, holds future actions
    character: Character, // Character instance
    actions: Vec<String>, // Serialized registered actions
}
```

### Combat Actions (`actions.rs`)

Available combat actions that can be performed during battle:

```rust
enum Action {
    Init,           // Initialize combat with initiative roll
    Flee,           // Attempt to escape combat
    Pass,          // Take a defensive stance
    Parry,          // Block incoming attack
    Dodge,          // Evade incoming attack
    Shoot,          // Perform ranged attack
    Attack,         // Perform melee attack
    CounterAttack,  // Counter-attack after successful defense
}
```

### Combat Resolution (`rolls.rs`)

Handles dice rolling and combat resolution:

```rust
struct Roll {
    r#type: Stat,      // Type of roll being performed
    character: Character, // Player character performing the roll
    npc: Npc,          // NPC involved in the roll
}

struct Result {
    success: bool,         // Whether the roll was successful
    failure: bool,         // Whether the roll failed
    critical_success: bool, // Whether the roll was a critical success
    critical_failure: bool, // Whether the roll was a critical failure
    result: Operator,      // Who gets the next turn
    value: String,        // String representation of the roll result
    output: i32,          // Numeric value of the roll
}
```

### Combat Logging (`logs.rs`)

Records combat events and their outcomes:

```rust
struct BattleLog {
    r#type: Operator,           // Type of actor performing the action
    text: String,              // Main log message
    flavor: String,            // Additional descriptive text
    result: Option<Operator>,   // Result of the action
    roll: Option<String>,      // Roll result if applicable
    value: Option<i32>,        // Numeric value if applicable
}
```

### Core Types (`types.rs`)

Fundamental types used throughout the battle system:

```rust
enum Operator {
    Character,  // Player character
    Npc,        // Non-player character
    System,     // System-generated action
}

enum Stat {
    End,    // Endurance
    For,    // Strength
    Hab,    // Dexterity
    Cha,    // Charisma
    Int,    // Intelligence
    Ini,    // Initiative
    Att,    // Attack
    Par,    // Parry
    Tir,    // Marksmanship
    Ap,     // Actions
    Pv,     // Health
}

enum Location {
    Head,   // Head hit location
    Arms,   // Arms hit location
    Legs,   // Legs hit location
    Torso,  // Torso hit location
}
```

### Usage

```rust
// Initialize a new battle
let battle_system = BattleSystem::init(character, npc);

// Start combat
battle_system.start_default();

// trigger combat actions
battle_system.action("attack");

// End combat
battle_system.end();
```

## Configuration

### System Variables

| Variable                       | Description                         |
| ------------------------------ | ----------------------------------- |
| `BATTLE_SYSTEM_CTA_LENGTH`     | Maximum length of combat turn queue |
| `BATTLE_SYSTEM_HISTORY_LENGTH` | Maximum length of combat history    |
| `BATTLE_SYSTEM_REAL_TIME`      | Real-time combat mode flag          |
