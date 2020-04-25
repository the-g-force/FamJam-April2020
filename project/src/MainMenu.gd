extends Control

const _Level : PackedScene = preload("res://src/Level.tscn")

const _Credits : PackedScene = preload("res://src/CreditsMenu.tscn")


func _on_StartButton_pressed():
	var _error = get_tree().change_scene_to(_Level)


func _on_CreditsButton_pressed():
	var _error = get_tree().change_scene_to(_Credits) # Replace with function body.
