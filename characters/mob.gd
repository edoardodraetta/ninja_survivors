extends CharacterBody2D

@export var mob_speed : float = 50

@onready var player = get_node("/root/Level/Player")
	
func _physics_process(_delta: float) -> void:
	
	var direction:Vector2 = global_position.direction_to(
		player.global_position
	)
	
	velocity = direction * mob_speed
	move_and_slide()
	
func take_damage():
	pass
