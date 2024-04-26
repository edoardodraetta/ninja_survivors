extends Node2D

# TODO
#func walk

func play_hurt():

	%AnimationPlayer.play("hurt")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	%AnimationPlayer.stop()
