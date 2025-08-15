extends Node2D

func _on_button_pressed():
	Signalbus.start_game.emit()
