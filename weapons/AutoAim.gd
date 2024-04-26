extends Area2D

func _physics_process(_delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		%ShootingPivot.look_at(target_enemy.global_position)
		
func shoot():
	# ! Make shuriken top level in inspector
	const SHURIKEN = preload("res://weapons/shuriken.tscn")
	var new_shuriken = SHURIKEN.instantiate()
	new_shuriken.global_position = %ShootingPoint.global_position
	new_shuriken.global_rotation = %ShootingPoint.global_rotation
	get_parent().add_child(new_shuriken)


func _on_timer_timeout() -> void:
	shoot()
