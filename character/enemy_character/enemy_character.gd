extends character
class_name enemy_character
var king: king
var target: team_character

func _init():
	Signalbus.king_has_arrived.connect(set_king)

func set_king(_king: king):
	king = _king
	target = king
	
func get_direction_animation() -> String:
	if !target:
		return "up"
	var direction = (target.position - global_position).normalized()
	if abs(direction.x) > abs(direction.y):
		return "side_right" if direction.x > 0 else "side_left"
	elif direction.y > 0:
		return "down"
	else:
		return "up"
