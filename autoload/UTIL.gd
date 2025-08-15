extends Node
class_name UTIL

enum GAME_SCENE {START, MENU, FIGHT}
enum BIOMES {GRASSLAND, DESERT, DUNGEON, OCEAN}
enum ENEMY_TYPES {GRUNT}

static var SCENE_PATH: Dictionary = {
	GAME_SCENE.START: "res://scenes/start/start_screen.tscn",
	GAME_SCENE.MENU: "res://scenes/menu/menu.tscn",
	GAME_SCENE.FIGHT: "res://scenes/fight/fight.tscn"
}

static var ENEMY_PATH: Dictionary = {
	ENEMY_TYPES.GRUNT: "res://character/enemy_character/orc/grunt/grunt.tscn"
}

static func get_enemy_path(enemy_type: ENEMY_TYPES) -> String:
	return ENEMY_PATH.get(enemy_type, "")

static func get_scene_path(game_scene: GAME_SCENE) -> String:
	return SCENE_PATH.get(game_scene, "")
