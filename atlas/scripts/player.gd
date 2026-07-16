extends CharacterBody2D

class_name Player

enum State {
	IDLE,
	MOVE,
	ATTACK,
	ABILITY,
	DASH,
	DIALOGUE_LOCKED,
	DEAD
}

@export var move_speed := 220.0

var current_state: State = State.IDLE

func _physics_process(_delta):
	match current_state:
		State.IDLE, State.MOVE:
			_handle_movement()

func _handle_movement():
	var input_vector := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = input_vector * move_speed

	if input_vector == Vector2.ZERO:
		current_state = State.IDLE
	else:
		current_state = State.MOVE

	move_and_slide()
