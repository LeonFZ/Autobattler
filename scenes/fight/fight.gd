extends Node2D

@onready var Enemies: Node = $Enemies
@onready var SpawnArea: CollisionShape2D = $Enemies/Area2D/SpawnArea
@onready var SafetyArea: CollisionShape2D = $Enemies/Area2D/SafetyArea

@export var params: arena_parameter
var enemy_type: UTIL.ENEMY_TYPES = UTIL.ENEMY_TYPES.GRUNT

const MAX_ATTEMPTS: int = 20  # Schutz vor Endlosschleife
const SAFETY_COLLISION_MASK: int = 1  # Setze hier den Layer deiner SafetyArea

func _ready() -> void:
	randomize()

	for i in params.enemy_amount:
		var packed_scene: PackedScene = load(UTIL.get_enemy_path(enemy_type)) as PackedScene
		var instance: Node2D = packed_scene.instantiate() as Node2D

		var spawn_position: Vector2 = get_valid_spawn_position()
		instance.position = spawn_position

		Enemies.add_child(instance)


func get_valid_spawn_position() -> Vector2:
	var spawn_shape: Shape2D = SpawnArea.shape
	var spawn_transform: Transform2D = SpawnArea.get_parent().global_transform

	for attempt in MAX_ATTEMPTS:
		var local_point: Vector2 = get_random_point_in_shape(spawn_shape)
		var global_point: Vector2 = spawn_transform.origin + local_point

		if not is_point_in_safety_area(global_point):
			return global_point

	# Fallback wenn keine freie Position gefunden wurde
	return spawn_transform.origin


func get_random_point_in_shape(shape: Shape2D) -> Vector2:
	if shape is RectangleShape2D:
		var rect: RectangleShape2D = shape as RectangleShape2D
		return Vector2(
			randf_range(-rect.size.x / 2, rect.size.x / 2),
			randf_range(-rect.size.y / 2, rect.size.y / 2)
		)
	elif shape is CircleShape2D:
		var circle: CircleShape2D = shape as CircleShape2D
		var angle: float = randf_range(0, TAU)
		var radius: float = sqrt(randf()) * circle.radius
		return Vector2(cos(angle), sin(angle)) * radius
	else:
		push_error("Unsupported shape type for random spawn")
		return Vector2.ZERO


func is_point_in_safety_area(point: Vector2) -> bool:
	var space_state: PhysicsDirectSpaceState2D = get_world_2d().direct_space_state

	var query := PhysicsPointQueryParameters2D.new()
	query.position = point
	query.collide_with_areas = true
	query.collision_mask = SAFETY_COLLISION_MASK

	var results: Array[Dictionary] = space_state.intersect_point(query, 1)
	for result in results:
		if result.collider == SafetyArea.get_parent():
			return true

	return false
