extends GameState

func enter():
	print("Entered Menu State")
	Signalbus.start_fight.connect(_enter_biome)
	
func exit():
	pass
	
func process(_delta):
	pass
	
func physics_process(_delta):
	pass

func _enter_biome(_biome: UTIL.BIOMES):
	game.current_biome = _biome
	game.scene_changer.change_to(UTIL.GAME_SCENE.FIGHT)
