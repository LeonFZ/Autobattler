extends State_Swordsman

var selected: bool = false
var mouse_offset: Vector2 = Vector2.ZERO
var cam

func enter():
	print("ENTER IDLE")
	cam = get_viewport().get_camera_2d()
	print(self, " : idle, position: ", character.global_position)
	print(self, " : idle, position: ", character.position)
	animated_sprite.play("idle_down")
	character.velocity = Vector2.ZERO
	character.speed = 0

func exit():
	pass

func process(_delta):
	if selected:
		transition.emit(self, "drag")
		
		

func follow_mouse():
	var current_mouse_world_pos = cam.get_global_mouse_position()
	character.global_position = current_mouse_world_pos + mouse_offset

func _on_drag_and_drop_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			cam = get_viewport().get_camera_2d()
			var mouse_world_position = cam.get_global_mouse_position()
			mouse_offset = character.global_position - mouse_world_position
			print("Character global pos:", character.global_position)
			print("Mouse world pos:", mouse_world_position)
			selected = true
			print("Dragging started")
		else:
			selected = false
			print("Dragging stopped")
			
