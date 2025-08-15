extends Control

@onready var start_button = $Button


func _on_button_pressed():
	Signalbus.start_combat.emit()
	start_button.visible = false
