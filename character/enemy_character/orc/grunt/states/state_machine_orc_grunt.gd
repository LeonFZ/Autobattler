extends Node
class_name State_Machine_Orc_Grunt

var states: Dictionary = {}
@export var current_state: State_Orc_Grunt

func _process(delta):
	current_state.process(delta)
	
func _physics_process(delta):
	current_state.physics_process(delta)


func start(_character: grunt, _animatedSprite: AnimatedSprite2D):
	for child in get_children():
		if child is State_Orc_Grunt:
			states[child.name.to_lower()] = child
			child.character = _character
			child.animated_sprite = _animatedSprite
			child.transition.connect(_changeState)
			
	if current_state:
		current_state.enter()
		
func _changeState(state: State_Orc_Grunt, new_state_name: String):
	if current_state != state:
		return
		
	if state:
		state.exit()
		
	var new_state = states[new_state_name.to_lower()]
	if new_state:
		new_state.enter()
		
	current_state = new_state
