extends Control


func _on_BackButton_audio_feedback_complete():
	var _error = get_tree().change_scene("res://src/MainMenu.tscn")
