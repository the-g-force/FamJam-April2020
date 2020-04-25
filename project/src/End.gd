extends Node

onready var _scoredisplay : Label = $Score

var _main : PackedScene = load("res://src/MainMenu.tscn")
var _level : PackedScene = load("res://src/Level.tscn")

func _ready():
	_scoredisplay.text = "Your score was:" + str(PlayerStats.score)

func _on_Restart_pressed():
	get_tree().change_scene_to(_level)
	PlayerStats.health = 10
	PlayerStats.score = 0

func _on_Main_pressed():
	get_tree().change_scene_to(_main)
	PlayerStats.health = 10
	PlayerStats.score = 0
