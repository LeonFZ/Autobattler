class_name Game
extends Node2D

@onready var game_container: Node = $GameContainer
@onready var initial_scene: UTIL.GAME_SCENE = UTIL.GAME_SCENE.START
@onready var scene_changer: SceneChanger = $SceneChanger

@export var state_machine: Game_State_Machine
@export var camera: Camera2D

var current_scene: Node
var current_biome: UTIL.BIOMES

func _ready():
	_initSceneChanger()
	_initScene()
	_initStateMachine()

	
func _initSceneChanger():
	scene_changer.game = self
	
func _initStateMachine():
	state_machine.start(self)
	
func _initScene():
	var path = UTIL.get_scene_path(initial_scene)
	var packed_scene = load(path)
	current_scene = packed_scene.instantiate()
	game_container.add_child(current_scene)
	
func _load_scene(scene_type: UTIL.GAME_SCENE):
	scene_changer.change_to(scene_type)
