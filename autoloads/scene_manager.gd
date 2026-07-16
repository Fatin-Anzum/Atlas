extends Node
## SceneManager — chapter loading into CurrentLevelContainer, fade transitions,
## spawn/checkpoint positioning, respawn.
## CONTRACT: method signatures below are frozen for Dev B integration (Phase 0).

var _current_chapter_id: String = ""

func load_chapter(chapter_id: String, spawn_point_id: String = "") -> void:
	# TODO(DevA - Phase 8): fade out -> free current level -> instance new level
	# under Main/CurrentLevelContainer -> position player at spawn_point_id -> fade in
	pass

func respawn() -> void:
	# TODO(DevA - Phase 8): reload current chapter at GameManager.get_checkpoint()
	pass

func get_current_chapter() -> String:
	return _current_chapter_id

func fade_out(duration: float = 0.5) -> void:
	# TODO(DevA - Phase 8)
	pass

func fade_in(duration: float = 0.5) -> void:
	# TODO(DevA - Phase 8)
	pass
