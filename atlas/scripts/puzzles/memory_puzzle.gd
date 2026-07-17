extends PuzzleBase

class_name MemoryPuzzle


func check_solution(_answer = null) -> bool:

	if puzzle_data == null:
		return false


	var selection: Array = _answer


	if selection == puzzle_data.integer_parameters:

		solve()
		return true


	return false
