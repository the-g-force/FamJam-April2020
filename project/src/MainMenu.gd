extends Control

const _Level : PackedScene = preload("res://src/Level.tscn")

const _Credits : PackedScene = preload("res://src/CreditsMenu.tscn")


func _ready():
	Jukebox.play_menu_music()
	

func _on_CreditsButton_audio_feedback_complete():
	var _error = get_tree().change_scene_to(_Credits) # Replace with function body.


func _on_StartButton_audio_feedback_complete():
	var _error = get_tree().change_scene_to(_Level)
