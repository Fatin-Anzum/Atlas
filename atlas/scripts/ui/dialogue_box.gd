extends CanvasLayer


@onready var name_label = $Panel/NameLabel
@onready var text_label = $Panel/TextLabel



func display_line(line):

	name_label.text = line.speaker_name

	text_label.text = line.text
	
func _unhandled_input(event):

	if event.is_action_pressed("interact"):

		DialogueManager.next_line()
