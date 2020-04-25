extends Control

func _on_BackButton_pressed():
	Jukebox.pressed.play()
	var _error = get_tree().change_scene("res://src/MainMenu.tscn")
