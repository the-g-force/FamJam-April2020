extends Control

func _on_BackButton_pressed():
	$ButtonClickSound.play()


func _on_ButtonClickSound_finished():
	var _error = get_tree().change_scene("res://src/MainMenu.tscn")
