# Battle System Documentation

## Overview

The battle system is a turn-based combat system that handles interactions between player and NPCs. It supports both real-time and turn-based combat modes, with an easy to use action system, logging, and combat tracking.

```rust
    struct BattleSystem {
        turn: u8,                 // Current turn
        npc: Npc,                 // Npc instance
        current: Operator,        // Current operator
        next: Operator,           // Next operator
        state: BattleState,       // Battle status
        settings: Settings,       // Core settings
        alterations: Alterations, // Characters status alterations
        character: Character,     // Character instance
        result: Option<Operator>, // Battle winner
        history: Vec<BattleLog>,  // Battle history logs
        cta: ActiveTimeBattle,    // Active Time Battle frame
        datas: SystemDatas,       // Battle system serialized datas
    }
```

### Actions

```rust
    enum Action {
        Pray,           // Manual buff
        Expose,         // Manual buff
        Protect,        // Manual buff
        Init,           // Automatic system action
        Flee,           // Manual defensive action
        Shoot,          // Manual offensive action
        Attack,         // Manual offensive action
        Pass,           // Automatic counter action
        Parry,          // Automatic counter action
        Dodge,          // Automatic counter action
        CounterAttack,  // Automatic counter action
    }
```

### Objects

```rust
    enum Object {
        Dirt,       // Offensive
        Torch,      // Offensive
        Bandage,    // Defensive
        WaterVial,  // Offensive
    }
```

### Alterations
```rust
    enum Alteration {
        Expose,     // Buff
        Protect,    // Buff
        Enlighten,  // Buff
        Burn,       // Ailment
        Bleed,      // Ailment
        Clear,      // No alteration, default state
    }
```

### Usage

```rust
// Initialize a new battle
let battle_system = BattleSystem::init(character, npc);

// Start combat
battle_system.start_default();

// trigger combat actions
battle_system.trigger_opponent_action("attack");

// trigger combat objects
battle_system.trigger_player_object("torch");

// End combat
battle_system.end();
```

## Configuration

### System Variables

| Variable                       | Description                          |
| ------------------------------ | ------------------------------------ |
| `BATTLE_SYSTEM_CTA_LENGTH`     | Maximum length of combat turn queue  |
| `BATTLE_SYSTEM_HISTORY_LENGTH` | Maximum length of combat history     |
| `BATTLE_SYSTEM_TAMPERING_ENV`  | Dices tampering environment variable |
