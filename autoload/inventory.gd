extends Node

var units: Dictionary = {}

func _ready():
	init_units(5, "swordsman")
	
func init_units(amount: int, unit_type: String):
	var scene_path = "res://character/team_character/Swordman/swordman.tscn"
	
	var unit_scene = load(scene_path)
	for i in range(amount):
		var instance = unit_scene.instantiate()
		var id = "%s_%d" % [unit_type, i]
		units[id] = instance

func print_units():
	for key in units.keys():
		print("Unit:", key, " → Type:", units[key].get_class())
