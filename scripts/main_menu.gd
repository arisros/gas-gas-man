extends Node2D

@onready var host_button = $HostButton
@onready var join_button = $JoinButton
@onready var ip_address = $IPAddress

func _ready():
	host_button.pressed.connect(_on_host_pressed)
	join_button.pressed.connect(_on_join_pressed)

func _on_host_pressed():
	if NetworkManager.host_game() == OK:
		get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_join_pressed():
	var ip = ip_address.text
	if ip == "":
		ip = "127.0.0.1"
	if NetworkManager.join_game(ip) == OK:
		get_tree().change_scene_to_file("res://scenes/Main.tscn")
