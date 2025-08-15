extends State_Orc_Grunt

func enter():
	character.speed = 1
		
func exit():
	pass
	
func process(_delta):
	if character.target:
		character.direction = (character.target.global_position - character.global_position)
	
func physics_process(_delta):
	pass


func _on_personal_space_body_entered(body):
	if body is team_character:
		print("new target: ", body)
		character.attacking = true
		character.target = body
		transition.emit(self, "attacking")
	
