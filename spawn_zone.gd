extends Node2D
class_name spawn_zone

@export var params: spawn_zone_params

func _ready():
	if params == null:
		print("ERROR: params are null in spawn zone: ", self)
		return
		
	var scene_key
	match params.type:
		spawn_zone_params.enemy_type.GRUNT: scene_key = "Grunt"
	
		
	
	var enemy_scene = types.enemy_types[scene_key]
	
	for i in params.amount:
		var enemy_instance = enemy_scene.instantiate()
		add_child(enemy_instance)
		# get_parent().add_child(enemy_instance)


		
		var rect = get_rect()
		enemy_instance.global_position = global_position + Vector2(
			randf() * rect.size.x,
			randf() * rect.size.y
		)



func get_rect() -> Rect2:
	var rect = $ColorRect.get_rect()
	return rect
