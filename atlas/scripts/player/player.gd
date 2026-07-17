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

var nearby_interactable: InteractableBase = null


@onready var ability_controller = $AbilityController



func _ready():

	$InteractionArea.area_entered.connect(_on_area_entered)
	$InteractionArea.area_exited.connect(_on_area_exited)



func _physics_process(_delta):

	match current_state:

		State.IDLE, State.MOVE:
			_handle_movement()


	if Input.is_action_just_pressed("attack"):

		attack()


	if Input.is_action_just_pressed("dash"):

		dash()


	if Input.is_action_just_pressed("cycle"):

		ability_controller.cycle_next()


	if Input.is_action_just_pressed("ability"):

		ability_controller.activate_current()


	if Input.is_action_just_pressed("interact"):

		if nearby_interactable != null:

			nearby_interactable.interact(self)



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



func _on_area_entered(area):

	if area is InteractableBase:

		nearby_interactable = area



func _on_area_exited(area):

	if area == nearby_interactable:

		nearby_interactable = null



func attack():

	if current_state != State.IDLE and current_state != State.MOVE:

		return


	current_state = State.ATTACK


	$HitBox.monitoring = true


	await get_tree().create_timer(0.2).timeout


	$HitBox.monitoring = false


	current_state = State.IDLE



func dash():

	if current_state != State.IDLE and current_state != State.MOVE:

		return


	current_state = State.DASH


	var original_speed = move_speed


	move_speed *= 2


	await get_tree().create_timer(0.15).timeout


	move_speed = original_speed


	current_state = State.IDLE
