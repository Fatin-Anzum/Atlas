extends InteractableBase

class_name NPC


@export var npc_data: NPCData


func interact(player):

	if npc_data == null:
		return

	DialogueManager.start_dialogue(
		npc_data.dialogue,
		player
	)
