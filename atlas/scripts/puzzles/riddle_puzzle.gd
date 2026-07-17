extends PuzzleBase

class_name RiddlePuzzle


func check_solution(_answer = null) -> bool:

	if puzzle_data == null:
		return false


	if puzzle_data.string_parameters.is_empty():
		return false


	var answer: String = str(_answer)


	if answer.to_lower() == puzzle_data.string_parameters[0].to_lower():

		solve()
		return true


	return false
