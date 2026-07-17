extends Node


var current_dialogue = null

var current_index := 0

var player: Player = null

var dialogue_box = null



func _ready():

	dialogue_box = preload(
		"res://scenes/ui/dialogue_box.tscn"
	).instantiate()

	get_tree().root.call_deferred(
		"add_child",
		dialogue_box
	)

	dialogue_box.hide()



func start_dialogue(dialogue, player_ref):

	if dialogue == null:
		return


	current_dialogue = dialogue

	current_index = 0

	player = player_ref


	player.current_state = Player.State.DIALOGUE_LOCKED


	GameManager.set_game_state(
		GameManager.GameState.DIALOGUE
	)


	EventBus.dialogue_started.emit()


	dialogue_box.show()


	_show_current_line()



func _show_current_line():

	var line = current_dialogue.lines[current_index]

	dialogue_box.display_line(line)



func next_line():

	current_index += 1


	if current_index >= current_dialogue.lines.size():

		end_dialogue()

		return


	_show_current_line()



func end_dialogue():

	dialogue_box.hide()


	player.current_state = Player.State.IDLE


	GameManager.set_game_state(
		GameManager.GameState.PLAYING
	)


	EventBus.dialogue_finished.emit()


	current_dialogue = null

	current_index = 0

	player = null
