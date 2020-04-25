extends Node

export var menu_music : AudioStream = preload("res://assets/music/Game_Jam.ogg")
export var game_music : AudioStream = preload("res://assets/music/mainloop.ogg")

onready var _music = $Music

func play_menu_music() -> void:
	_play(menu_music)

	
func play_game_music() -> void:
	_play(game_music)


func _play(stream:AudioStream):
	_music.stream = stream
	if not _music.playing:
		_music.play()
