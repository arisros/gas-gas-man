# GasGasMan Project Context

## Overview
GasGasMan is a multiplayer top-down game built with Godot 4.5 using GDScript. It features basic networking capabilities allowing players to host and join game sessions.

## Project Structure

### Directories
- **`scenes/`**: Contains the game's scenes.
    - `Main.tscn`: The main game world/level.
    - `character.tscn`: The player character scene.
    - `main_menu.tscn`: The starting menu interface.
- **`scripts/`**: Contains the game logic in GDScript.
    - `player.gd`: Handles player movement and network synchronization.
    - `network.gd`: Manages multiplayer connections (hosting/joining).
    - `main.gd`: Basic game loop or test script.
- **`assests/`**: Contains raw assets (sprites, images). Note: Directory name has a typo.
- **`assets/`**: Contains map assets and potentially other resources.

### Key Scripts Analysis

#### `scripts/player.gd`
- Extends `CharacterBody2D`.
- Implements top-down movement logic using `move_and_slide()`.
- **Networking**:
    - Uses `is_multiplayer_authority()` to restrict control to the local player.
    - Synchronizes position with other peers via `@rpc(any_peer)` and `rpc_unreliable("update_remote_position")`.

#### `scripts/network.gd`
- Manages `ENetMultiplayerPeer`.
- Functions:
    - `host_game(port := 9000)`: Starts a server on the specified port.
    - `join_game(ip: String, port := 9000)`: Connects to a server at the specified IP and port.

#### `scripts/main.gd`
- Extends `Node2D`.
- Contains basic movement logic for testing, directly modifying `position`.

## Technical Details
- **Engine Version**: Godot 4.5
- **Networking**: High-level Multiplayer API with ENet.
- **Input**: Uses standard `ui_up`, `ui_down`, `ui_left`, `ui_right` actions.

## Current State
The project has foundational multiplayer movement and connection logic implemented. Players can move a character, and their position is synchronized across the network.
