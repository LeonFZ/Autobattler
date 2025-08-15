extends enemy_character
class_name grunt

@export var state_machine: State_Machine_Orc_Grunt
@export var animated_sprite: AnimatedSprite2D
@export var raycast: RayCast2D
@export var personal_space: Area2D
var attacking: bool = false

func _ready():
	state_machine.start(self, animated_sprite)
