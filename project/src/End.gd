extends Node

onready var _scoredisplay : Label = $Score

var _main : PackedScene = load("res://src/MainMenu.tscn")
var _level : PackedScene = load("res://src/Level.tscn")

func _ready():
	_scoredisplay.text = "Your score was:" + str(PlayerStats.score)


func _on_Restart_pressed():
	PlayerStats.health = 10
	PlayerStats.score = 0
	var _error = get_tree().change_scene_to(_level)


func _on_Main_pressed():
	PlayerStats.health = 10
	PlayerStats.score = 0
	var _error = get_tree().change_scene_to(_main)

