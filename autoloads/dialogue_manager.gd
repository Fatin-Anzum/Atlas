extends Node
## DialogueManager — dialogue engine: loads DialogueData, drives the DialogueBox UI,
## typewriter state, fires flag/journal signals.
## Not responsible for dialogue text content — that's Dev B (.tres resources).
## CONTRACT: method signatures below are frozen for Dev B integration (Phase 0).
## The node names/methods this script calls on the DialogueBox UI are also frozen —
## Dev B can reskin ui/dialogue_box/dialogue_box.tscn without touching this file.

var _is_active: bool = false
var _current_dialogue_id: String = ""

func start_dialogue(dialogue_data: Resource) -> void:
	# TODO(DevA - Phase 4): set GameManager state to DIALOGUE, show DialogueBox,
	# begin typewriter on first line, emit EventBus.dialogue_started
	pass

func advance() -> void:
	# TODO(DevA - Phase 4): advance to next DialogueLine, or end_dialogue() if finished
	pass

func end_dialogue() -> void:
	# TODO(DevA - Phase 4): hide DialogueBox, restore GameManager state,
	# emit EventBus.dialogue_finished
	pass

func is_active() -> bool:
	return _is_active
