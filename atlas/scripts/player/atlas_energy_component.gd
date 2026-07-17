extends Node

signal energy_changed(current: float, maximum: float)

@export var max_energy := 100.0
@export var regen_rate := 5.0

var current_energy := max_energy

func _process(delta):
	if current_energy < max_energy:
		current_energy = min(current_energy + regen_rate * delta, max_energy)
		energy_changed.emit(current_energy, max_energy)

func try_spend(cost: float) -> bool:
	if current_energy < cost:
		return false

	current_energy -= cost
	energy_changed.emit(current_energy, max_energy)
	return true
