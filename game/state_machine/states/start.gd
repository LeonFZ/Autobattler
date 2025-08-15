extends GameState

func enter():
	Signalbus.start_game.connect(_start_game)
	
func exit():
	pass
	
func process(_delta):
	pass
	
func physics_process(_delta):
	pass

func _start_game():
	game.scene_changer.change_to(UTIL.GAME_SCENE.MENU)
	transition.emit(self, "Menu")
