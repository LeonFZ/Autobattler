extends CharacterBody2D
class_name character

var speed = 100
var direction: Vector2 = Vector2.DOWN
var damage: int = 50
var health: int = 100

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
func take_damage(amount: int):
	health -= amount
	if health <= 0:
		die()
	print(self, " take damage, health: ", health)
		
func die():
	pass
