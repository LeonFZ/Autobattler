extends Node2D


func _on_level_grass_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Signalbus.start_fight.emit(UTIL.BIOMES.GRASSLAND)


func _on_level_sand_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Signalbus.start_fight.emit(UTIL.BIOMES.DESERT)


func _on_level_dungeon_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Signalbus.start_fight.emit(UTIL.BIOMES.DUNGEON)


func _on_level_ocean_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Signalbus.start_fight.emit(UTIL.BIOMES.OCEAN)
