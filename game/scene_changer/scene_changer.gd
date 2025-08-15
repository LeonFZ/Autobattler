extends CanvasLayer
class_name SceneChanger

@onready var game_container: Node = $GameContainer
@onready var anim_player: AnimationPlayer = $SceneChanger_Animation
@onready var scene_changer: CanvasLayer = $SceneChanger
@onready var screen_blender: ColorRect = $ScreenBlender

var game: Game
var _scene_type: UTIL.GAME_SCENE

func _ready():
	screen_blender.modulate = Color(0,0,0,0)

func change_to(scene_type: UTIL.GAME_SCENE):
	_scene_type = scene_type
	
	if game.current_scene:
		game.current_scene.queue_free()
			
	if anim_player.is_playing():
		anim_player.stop()
		
	anim_player.play("Fade in Out")

func _new_scene():
	var path = UTIL.get_scene_path(_scene_type)
	var packed_scene = load(path)
	game.current_scene = packed_scene.instantiate()
	game.game_container.add_child(game.current_scene)
