class_name NPCData
extends Resource

@export var npc_id: String = ""
@export var display_name: String = ""

@export var portrait: Texture2D

@export var dialogue: DialogueData

# Optional story gating
@export var required_flag: String = ""
@export var one_time_only: bool = false
