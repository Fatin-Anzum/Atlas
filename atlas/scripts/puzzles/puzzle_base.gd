extends Node2D

class_name PuzzleBase

signal puzzle_solved(puzzle_id: String)

@export var puzzle_data: PuzzleData

var solved := false

func start_puzzle() -> void:
	pass

func check_solution(_answer = null) -> bool:
	return false

func solve() -> void:
	if solved:
		return

	solved = true

	if puzzle_data != null:
		EventBus.puzzle_solved.emit(puzzle_data.puzzle_id)
		puzzle_solved.emit(puzzle_data.puzzle_id)
