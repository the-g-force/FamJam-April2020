extends Control

var _Level : PackedScene = preload("res://src/Level.tscn")

func _on_StartButton_pressed():
	var _error = get_tree().change_scene_to(_Level)
