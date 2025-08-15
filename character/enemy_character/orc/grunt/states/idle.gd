extends State_Orc_Grunt

func enter():
	animated_sprite.play("idle_up")
	character.speed = 0
	Signalbus.start_combat.connect(_start_combat)
	
func exit():
	pass
	
func process(_delta):
	match character.get_direction_animation():
		"side_right": 
			animated_sprite.play("idle_side")
		"side_left": 
			animated_sprite.play("idle_side")
			animated_sprite.flip_h = true
		"up": 
			animated_sprite.play("idle_up")
		"down": 
			animated_sprite.play("idle_down")
			
	if !character.target:
		if character.king:
			character.target = character.king
		else:
			Signalbus.who_is_the_king.emit()
	
func physics_process(_delta):
	pass

func _start_combat():
	transition.emit(self, "targeting")
