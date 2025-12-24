### 🎮 **Langres** – Classic isometric RPG game

Langres is an offline role-playing game featuring procedural world-building, a custom game engine, and a real-time 3D Graphics. Built with Tauri and React, it leverages Three Fiber for smooth and dynamic visualization.

---

### 🏗 **Stack**

Langres is built using modern and efficient technologies:

🛠 Tauri – Lightweight and secure framework for building the desktop application.
🖥 React – Flexible and component-based UI development.
🎮 Three Fiber – 3D rendering library for real-time visualizations.
⚡ Rust – Ensuring high performance and reliability for the game engine.

---

### ⚙️ **Core Features**

Langre is an **indie role-playing game**, with a custom game engine built in Rust, with a focus on **fully procedural 2D map generation** and **customization through an admin interface**.

🔹 **Hexagonal Grid Layout** – Generates rpg ready hex grid maps.  
🔹 **Custom WFC Algorithm** – Implements a custom [Wave Function Collapse](https://en.wikipedia.org/wiki/Model_synthesis) (WFC) algorithm for procedural generation.  
🔹 **Pre- & Post-Processing Actions** – Enhance procedural generation with actions.  
🔹 **Fully Editable Maps** – Modify and fine-tune maps after generation.

---

### 💻 **Local Setup**

To run the game locally you need:

-   [Node-js](https://nodejs.org/en/download)
-   [Rust](https://www.rust-lang.org/tools/install)
-   [Docker](https://docs.docker.com/desktop/) (optional)
-   [Task](https://taskfile.dev/installation/) (optional)

Task provides a simple and comprehensive cli interface to install/build/run the game locally. It also provides commands to run the game through Docker.

You can run most of the engine's features and utilities through Docker, altough to actually run the game locally, you will need Nodejs and Rust on your machine.

#### **Frontend commands**

| Operation  | Command               | Description                   |
| ---------- | --------------------- | ----------------------------- |
| Install    | `npm install`         | Install frontend dependencies |
| Run game   | `npm run tauri dev`   | Build and launch local game   |
| Build game | `npm run tauri build` | Build and compile             |

#### **Backend commands (within src-tauri dir)**

| Operation      | Command                                                    | Description           |
| -------------- | ---------------------------------------------------------- | --------------------- |
| Run migrations | `diesel migration redo --all --database-url="database.db"` | Apply migrations      |
| Run linter     | `cargo clippy`                                             | Run Rust linter       |
| Run tests      | `cargo test -- --test-threads=1`                           | Run unit tests        |
| Run shell      | `cargo run --bin shell`                                    | Run interactive shell |

#### **Docker commands**

| Operation      | Command                           | Description           |
| -------------- | --------------------------------- | --------------------- |
| Build          | `docker compose build`            | Build core image      |
| Run linter     | `docker compose run --rm lint`    | Run Rust linter       |
| Run tests      | `docker compose run --rm test`    | Run unit tests        |
| Run migrations | `docker compose run --rm migrate` | Run migrations        |
| Run shell      | `docker compose run --rm shell`   | Run interactive shell |

#### **Task commands**

| Operation      | Command        | Description                               |
| -------------- | -------------- | ----------------------------------------- |
| Init           | `task init`    | Install frontend and backend dependencies |
| Build          | `task build`   | Build and compile project                 |
| Run game       | `task dev`     | Run local game                            |
| Run migrations | `task migrate` | Run migrations                            |
| Run shell      | `task shell`   | Run interactive shell                     |
| Run tests      | `task tests`   | Run unit tests                            |
| Run linter     | `task lint`    | Run frontend and backend linter           |

#### **Docker Task commands**

| Operation      | Command               | Description           |
| -------------- | --------------------- | --------------------- |
| Build          | `tast docker-init`    | Build core image      |
| Run linter     | `tast docker-lint`    | Run Rust linter       |
| Run tests      | `tast docker-tests`   | Run unit tests        |
| Run migrations | `tast docker-migrate` | Run migrations        |
| Run shell      | `tast docker-shell`   | Run interactive shell |

---

### 📝 **Roadmap**

## Phase 1: Story Integration and Asset Development

### 1. Implement Acts and Map Switching

-   Develop a system for progression between different acts and maps.
-   Ensure smooth transitions and state management.

### 2. 3D Modeling and Asset Creation

-   Continue creating and refining 3D assets.
-   Integrate these assets into the maps and acts.

### 3. User Interface (UI) Refinement

-   Enhance UI, focusing on aesthetic and functional improvements.
-   Integrate UI elements with the story and gameplay.

## Phase 2: Gameplay Mechanics and Content Development

### 4. NPCs, Dialogues, and Interaction Systems

-   Design and implement NPC characters with unique dialogues and interactions.
-   Create a dialogue system supporting story progression and player choices.

### 5. Loot System and Inventory Management

-   Develop a loot system, including item drops and inventory management.
-   Balance the loot system for game progression.

### 6. Complete Combat and Aggression Mechanics

-   Finalize enemy aggression and combat mechanics.
-   Integrate these mechanics into the game flow and story progression.

## Phase 3: Polishing, Optimization, and Testing

### 7. Gameplay Polishing and Balancing

-   Refine gameplay mechanics based on feedback.
-   Balance difficulty levels, enemy behaviors, and rewards.

### 8. Performance Optimization

-   Optimize front-end and back-end components.

### 9. Alpha/Beta Testing

-   Conduct testing with external players for feedback.

## Phase 4: Final Preparations and Launch

### 10. Final Asset Integration and Bug Fixes

-   Integrate remaining assets and fix bugs.

### 11. Marketing and Promotional Activities

-   Increase marketing efforts with trailers and social media.

### 12. Launch Preparation

-   Prepare for launch and deployment.

### 13. Official Game Launch

-   Release the game to the public.

## Phase 5: Post-Launch Support and Updates

### 14. Post-Launch Monitoring and Patches

-   Monitor game performance and release patches as needed.

### 15. Future Content and Updates

-   Plan and develop additional content based on feedback.
