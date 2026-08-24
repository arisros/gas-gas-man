extends Node

@onready var peer = ENetMultiplayerPeer.new()

func host_game(port := 9000):
	var error = peer.create_server(port)
	if error != OK:
		push_error("Cannot host: %s" % error)
		return
	multiplayer.multiplayer_peer = peer
	print("Hosting game on port %s" % port)

func join_game(ip: String, port := 9000):
	var error = peer.create_client(ip, port)
	if error != OK:
		push_error("Cannot connect: %s" % error)
		return
	multiplayer.multiplayer_peer = peer
	print("Joined server at %s:%s" % [ip, port])
