extends PuzzleBase

class_name GearPuzzle


func check_solution(_answer = null) -> bool:

	if puzzle_data == null:
		return false


	var order: Array = _answer


	if order == puzzle_data.integer_parameters:

		solve()
		return true


	return false
