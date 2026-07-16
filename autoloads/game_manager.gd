extends Node
## GameManager — flags, relics, memory fragments, journal entry IDs, game state.
## CONTRACT: method signatures below are frozen for Dev B integration (Phase 0).
## Bodies are stubs for now; real implementation lands in Phase 3.

enum State { PLAYING, PAUSED, DIALOGUE, CUTSCENE }

var _state: State = State.PLAYING
var _flags: Dictionary = {}
var _relics: Array[String] = []
var _fragments: Array[String] = []
var _journal_entries: Array[String] = []
var _current_checkpoint_id: String = ""

# --- Flags ---

func set_flag(flag_id: String, value: bool = true) -> void:
	# TODO(DevA - Phase 3): store flag, emit EventBus.flag_changed
	pass

func has_flag(flag_id: String) -> bool:
	# TODO(DevA - Phase 3): return _flags.get(flag_id, false)
	return false

# --- Relics ---

func add_relic(relic_id: String) -> void:
	# TODO(DevA - Phase 3): append if new, emit EventBus.relic_obtained
	pass

func has_relic(relic_id: String) -> bool:
	# TODO(DevA - Phase 3)
	return false

# --- Memory Fragments ---

func collect_fragment(fragment_id: String) -> void:
	# TODO(DevA - Phase 3): append if new, emit EventBus.memory_fragment_collected
	pass

func has_fragment(fragment_id: String) -> bool:
	# TODO(DevA - Phase 3)
	return false

func get_fragment_count() -> int:
	# TODO(DevA - Phase 3): used by Hidden Ending gating (needs all 10)
	return _fragments.size()

# --- Journal ---

func add_journal_entry(entry_id: String) -> void:
	# TODO(DevA - Phase 3)
	pass

func has_journal_entry(entry_id: String) -> bool:
	# TODO(DevA - Phase 3)
	return false

# --- Checkpoints ---

func set_checkpoint(checkpoint_id: String) -> void:
	# TODO(DevA - Phase 8): store id, emit EventBus.checkpoint_reached
	pass

func get_checkpoint() -> String:
	# TODO(DevA - Phase 8)
	return _current_checkpoint_id

# --- Game State ---

func set_state(new_state: State) -> void:
	# TODO(DevA - Phase 3)
	pass

func get_state() -> State:
	return _state

# --- Serialization support (used by SaveManager) ---

func get_save_data() -> Dictionary:
	# TODO(DevA - Phase 8): return a Dictionary snapshot for SaveManager
	return {}

func load_save_data(data: Dictionary) -> void:
	# TODO(DevA - Phase 8): restore state from a Dictionary
	pass
