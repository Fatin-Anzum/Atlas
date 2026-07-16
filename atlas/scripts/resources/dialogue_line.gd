class_name DialogueLine
extends Resource

@export var speaker_name: String = ""
@export_multiline var text: String = ""
@export var portrait: Texture2D

# Optional gameplay hooks
@export var set_flag: String = ""
@export var unlock_journal_entry: String = ""
