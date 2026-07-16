extends Node
## SaveManager — JSON serialization to user://savegame.json.
## CONTRACT: method signatures below are frozen for Dev B integration (Phase 0).

const SAVE_PATH := "user://savegame.json"

# NOTE: `load` shadows GDScript's global load() *inside this script only*.
# If this file ever needs to load a Resource, call it as `@GlobalScope.load(path)`.

func save() -> void:
	# TODO(DevA - Phase 8): gather GameManager.get_save_data(), write JSON via FileAccess
	pass

func load() -> void:
	# TODO(DevA - Phase 8): read JSON via FileAccess, pass to GameManager.load_save_data()
	pass

func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func delete_save() -> void:
	# TODO(DevA - Phase 8)
	pass
