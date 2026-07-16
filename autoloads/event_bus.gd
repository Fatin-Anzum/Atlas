extends Node
## EventBus — global cross-cutting signals only.
## No logic lives here. Any system may emit; any system may listen.
## CONTRACT: freeze these signatures early — Dev B's UI connects directly to them.

# --- Player / world state ---
signal player_died
signal relic_obtained(relic_id: String)
signal memory_fragment_collected(fragment_id: String)
signal flag_changed(flag_id: String, value: bool)
signal chapter_completed(chapter_id: String)
signal checkpoint_reached(checkpoint_id: String)

# --- Dialogue ---
signal dialogue_started(dialogue_id: String)
signal dialogue_finished(dialogue_id: String)

# --- Puzzles ---
signal puzzle_solved(puzzle_id: String)

# --- Combat ---
signal boss_phase_changed(boss_id: String, phase: int)
signal boss_defeated(boss_id: String)
