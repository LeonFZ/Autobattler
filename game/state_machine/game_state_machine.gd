extends Node
class_name Game_State_Machine

var states: Dictionary = {}
@export var current_state: GameState

func _process(delta):
	current_state.process(delta)
	
func _physics_process(delta):
	current_state.physics_process(delta)


func start(_game: Game):
	for child in get_children():
		if child is GameState:
			states[child.name.to_lower()] = child
			child.game = _game
			child.transition.connect(_changeState)
			
	if current_state:
		current_state.enter()
		
func _changeState(state: GameState, new_state_name: String):
	if current_state != state:
		return
		
	if state:
		state.exit()
		
	var new_state = states[new_state_name.to_lower()]
	if new_state:
		new_state.enter()
		
	current_state = new_state
