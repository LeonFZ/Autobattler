extends State_Orc_Grunt

func enter():
	if !character.target and character.king:
		character.attacking = false
		character.target = character.king

	animated_sprite.play("idle_front")
	character.speed = 0

	
	
	
func exit():
	pass
	
func process(_delta):
	var nearby_enemy = _find_enemy_in_personal_space()

	if nearby_enemy:
		# Feind im Weg → Umschalten und angreifen
		character.target = nearby_enemy
		character.attacking = true
		if get_name() != "attacking":
			transition.emit(self, "attacking")
	else:
		# Kein Feind im Weg → Ziel ist der King
		character.target = character.king
		character.attacking = false
		if get_name() != "charging":
			transition.emit(self, "charging")

	
func physics_process(_delta):
	pass
	
func _find_enemy_in_personal_space() -> team_character:
	for i in character.personal_space.get_children():
		if i is team_character and i.team != character.team:
			return i
	return null

	
func _check_for_enemies() -> bool:
	for i in character.personal_space.get_children():
		if i is team_character:
			return true
	return false
