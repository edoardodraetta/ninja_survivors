extends Node2D

func _ready():
	pass

func spawn_mob():
	# smart load
	var new_mob = preload("res://mobs/mob.tscn").instantiate()
	
	# get random point along the path
	%MobSpawnPoint.progress_ratio = randf()
	new_mob.global_position = %MobSpawnPoint.global_position
	
	# spawn mob
	add_child(new_mob)


func _on_mob_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
