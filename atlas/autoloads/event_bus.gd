
extends Node

#
# STORY EVENTS
# 

signal chapter_completed(chapter_id: String)
signal flag_changed(flag_name: String, value: bool)

#
# COLLECTIBLES
#

signal relic_obtained(relic_id: String)
signal memory_fragment_collected(fragment_id: String)
signal journal_entry_unlocked(entry_id: String)

#
# DIALOGUE
#

signal dialogue_started
signal dialogue_finished

#
# PLAYER
#

signal player_died

#
# PUZZLES
#

signal puzzle_solved(puzzle_id: String)

#
# SAVE / CHECKPOINTS
#

signal checkpoint_updated(checkpoint_id: String)

#
# GAME STATE
#

signal game_state_changed(state)
