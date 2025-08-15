extends team_character
class_name swordman

@export var state_machine: State_Machine_Swordsman
@export var animatedSprite2D: AnimatedSprite2D

func _ready():
	state_machine.start(self, animatedSprite2D)
	
func die():
	animatedSprite2D.play("death")
	animatedSprite2D.connect("animation_finished", _freePlayer)
	
func _freePlayer():
	self.queue_free()
