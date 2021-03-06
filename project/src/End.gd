extends Node

onready var _scoredisplay : Label = $Score

var _main : PackedScene = load("res://src/MainMenu.tscn")
var _level : PackedScene = load("res://src/Level.tscn")

func _ready():
	_scoredisplay.text = "You saved " + str(PlayerStats.score) + " chickens!"


func _on_Restart_audio_feedback_complete():
	PlayerStats.reset()
	var _error = get_tree().change_scene_to(_level)


func _on_Main_audio_feedback_complete():
	PlayerStats.reset()
	var _error = get_tree().change_scene_to(_main)
