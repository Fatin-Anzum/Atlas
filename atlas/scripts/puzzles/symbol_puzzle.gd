extends PuzzleBase

class_name SymbolPuzzle

func check_solution(answer = null) -> bool:
	if puzzle_data == null:
		return false

	if answer is Array and answer == puzzle_data.string_parameters:
		solve()
		return true

	return false
