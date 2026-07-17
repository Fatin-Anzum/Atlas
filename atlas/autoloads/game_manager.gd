extends Node




#
# GAME STATE
#

enum GameState {
	PLAYING,
	PAUSED,
	DIALOGUE,
	CUTSCENE
}

var game_state: GameState = GameState.PLAYING

var current_chapter: String = "prologue"


#
# PLAYER PROGRESS
#

var relics: Array[String] = []

var memory_fragments: Array[String] = []

var journal_entries: Array[String] = []

var flags: Dictionary = {}


#
# CHECKPOINT
#

var checkpoint := {
	"chapter": "",
	"id": "",
	"position": Vector2.ZERO
}


#
# INITIALIZATION
#

func _ready() -> void:
	EventBus.flag_changed.connect(_on_flag_changed)


#
# FLAGS
#

func set_flag(flag_name: String, value: bool = true) -> void:
	flags[flag_name] = value
	EventBus.flag_changed.emit(flag_name, value)


func has_flag(flag_name: String) -> bool:
	return flags.get(flag_name, false)


func remove_flag(flag_name: String) -> void:
	if flags.has(flag_name):
		flags.erase(flag_name)
		EventBus.flag_changed.emit(flag_name, false)


#
# RELICS
#

func add_relic(relic_id: String) -> void:
	if relics.has(relic_id):
		return

	relics.append(relic_id)
	EventBus.relic_obtained.emit(relic_id)


func has_relic(relic_id: String) -> bool:
	return relics.has(relic_id)


#
# MEMORY FRAGMENTS
#

func add_memory_fragment(fragment_id: String) -> void:
	if memory_fragments.has(fragment_id):
		return

	memory_fragments.append(fragment_id)
	EventBus.memory_fragment_collected.emit(fragment_id)


func has_memory_fragment(fragment_id: String) -> bool:
	return memory_fragments.has(fragment_id)


func memory_fragment_count() -> int:
	return memory_fragments.size()


#
# JOURNAL
#

func unlock_journal_entry(entry_id: String) -> void:
	if journal_entries.has(entry_id):
		return

	journal_entries.append(entry_id)
	EventBus.journal_entry_unlocked.emit(entry_id)


func has_journal_entry(entry_id: String) -> bool:
	return journal_entries.has(entry_id)


#
# CHECKPOINTS
#

func set_checkpoint(chapter: String, checkpoint_id: String, position: Vector2) -> void:
	checkpoint.chapter = chapter
	checkpoint.id = checkpoint_id
	checkpoint.position = position

	EventBus.checkpoint_updated.emit(checkpoint_id)


func get_checkpoint() -> Dictionary:
	return checkpoint


#
# CHAPTERS
#

func set_current_chapter(chapter_id: String) -> void:
	current_chapter = chapter_id


func complete_current_chapter() -> void:
	EventBus.chapter_completed.emit(current_chapter)


#
# GAME STATE
#

func set_game_state(state: GameState) -> void:
	game_state = state
	EventBus.game_state_changed.emit(state)


func is_playing() -> bool:
	return game_state == GameState.PLAYING


func is_paused() -> bool:
	return game_state == GameState.PAUSED


func is_dialogue() -> bool:
	return game_state == GameState.DIALOGUE


func is_cutscene() -> bool:
	return game_state == GameState.CUTSCENE


#
# SAVE SUPPORT
#

func reset_progress() -> void:
	relics.clear()
	memory_fragments.clear()
	journal_entries.clear()
	flags.clear()

	current_chapter = "prologue"

	game_state = GameState.PLAYING

	checkpoint = {
		"chapter": "",
		"id": "",
		"position": Vector2.ZERO
	}


#
# DEBUG
#

func _on_flag_changed(flag_name: String, value: bool) -> void:
	print("Flag Changed -> ", flag_name, ": ", value)
