extends State_Orc_Grunt

func enter():
	animated_sprite.connect("animation_finished", _on_attack_animation_finished)
	
	character.speed = 0
	match character.get_direction_animation():
		"side_right": 
			animated_sprite.play("attack_side")
		"side_left": 
			animated_sprite.play("attack_side")
			animated_sprite.flip_h = true
		"up": 
			animated_sprite.play("attack_up")
		"down": 
			animated_sprite.play("attack_down")
				
	
func exit():
	pass
	
func process(_delta):
	pass

func physics_process(_delta):
	pass

func _on_attack_animation_finished():
	if character.target:
		character.target.take_damage(character.damage)
	transition.emit(self, "targeting")
