extends Node2D

const PlayerScene = preload("res://scenes/character.tscn")

func _ready():
# Only the server handles spawning logic
if multiplayer.is_server():
multiplayer.peer_connected.connect(add_player)
multiplayer.peer_disconnected.connect(remove_player)

# Spawn host
add_player(1)

# Spawn existing peers (e.g. if connected before scene load)
for peer_id in multiplayer.get_peers():
add_player(peer_id)

func add_player(peer_id):
var player = PlayerScene.instantiate()
player.name = str(peer_id)
add_child(player)

func remove_player(peer_id):
var player = get_node_or_null(str(peer_id))
if player:
player.queue_free()
