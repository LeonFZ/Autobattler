extends team_character
class_name king

@export var animation: AnimatedSprite2D

func _ready():
	Signalbus.who_is_the_king.connect(_i_am_the_king)
	speed = 50
	animation.play("idle_side")

func _i_am_the_king():
	Signalbus.king_has_arrived.emit(self)
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
