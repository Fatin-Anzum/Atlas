extends Node


var unlocked_abilities: Array = []

var current_index := 0



func unlock_ability(ability):

	if ability in unlocked_abilities:
		return

	unlocked_abilities.append(ability)

	print("Unlocked ability:", ability)



func cycle_next():

	if unlocked_abilities.is_empty():
		print("No abilities unlocked")
		return


	current_index += 1


	if current_index >= unlocked_abilities.size():
		current_index = 0


	print(
		"Current ability:",
		unlocked_abilities[current_index]
	)



func activate_current():

	if unlocked_abilities.is_empty():
		print("No ability available")
		return


	var ability = unlocked_abilities[current_index]


	print(
		"Activated ability:",
		ability
	)


	# Later:
	# ability.execute()
