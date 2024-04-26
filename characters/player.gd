extends CharacterBody2D

const DAMAGE_RATE : float = 100 
signal health_depleted
@export var player_health : float = 100.0
@export var speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree['parameters/playback']

func _ready():
	animation_tree['parameters/Idle/blend_position'] = starting_direction
	$ProgressBar.value = player_health

func _physics_process(delta: float) -> void:
	
	# Movement and Animation
	var direction = Input.get_vector(
		"move_left", "move_right", 
		"move_up", "move_down"
	)

	velocity = speed * direction
	
	update_animation(direction)
	move_and_slide()
	pick_new_state()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		player_health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$ProgressBar.value = player_health		
		if player_health <= 0.0:
			health_depleted.emit()

## Take the move input direction and update the animation
func update_animation(move_input : Vector2):
	if move_input: # != 0
		animation_tree['parameters/Walk/blend_position'] = move_input
		animation_tree['parameters/Idle/blend_position'] = move_input
		

## Pick an animation state based on the velocity
func pick_new_state():
	if velocity:
		state_machine.travel('Walk')
	else:
		state_machine.travel('Idle')
