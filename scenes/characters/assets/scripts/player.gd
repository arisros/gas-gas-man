extends CharacterBody2D

@export var speed := 120.0
var id = 0

func _ready():
	id = multiplayer.get_unique_id()

func _physics_process(delta):
	if not is_multiplayer_authority():
		return
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	velocity = input_vector * speed
	move_and_slide()
	rpc_unreliable("update_remote_position", global_position)

@rpc(any_peer)
func update_remote_position(pos: Vector2):
	if not is_multiplayer_authority():
		global_position = pos
