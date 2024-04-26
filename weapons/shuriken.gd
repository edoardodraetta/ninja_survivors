extends Area2D

@export var shuriken_speed:float = 50
var traveled_distance = 0
const RANGE = 1200

func _ready() -> void:
	print("Shuriken~")
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += shuriken_speed * direction * delta
	traveled_distance += shuriken_speed * delta
	if traveled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:

	queue_free()
	if body.has_method("take_damage"): # duck typing
		body.take_damage()
