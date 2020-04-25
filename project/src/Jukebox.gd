extends Node

export var menu_music : AudioStream = preload("res://assets/music/Game_Jam.ogg")
export var game_music : AudioStream = preload("res://assets/music/mainloop.ogg")

onready var pressed : AudioStreamPlayer = $ButtonPressed
onready var _music = $Music

var _main_menu_playing : bool = false

func play_menu_music() -> void:
	# Special handling for main menu music to handle transition to/from
	# the credits screen
	if not _main_menu_playing:
		_play(menu_music)
		_main_menu_playing = true

	
func play_game_music() -> void:
	_play(game_music)


func _play(stream:AudioStream):
	_music.stream = stream
	if not _music.playing:
		_music.play()
