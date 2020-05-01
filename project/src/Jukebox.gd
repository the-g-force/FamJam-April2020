extends Node

enum Song {
	NONE,
	MENU,
	GAME
}

const _SONG_MAP = {
	Song.MENU: preload("res://assets/music/Game_Jam.ogg"),
	Song.GAME: preload("res://assets/music/mainloop.ogg")
}

onready var _music = $Music

var _song = Song.NONE


func play_menu_music() -> void:
	_play(Song.MENU)

	
func play_game_music() -> void:
	_play(Song.GAME)


func _play(selection):
	if _song != selection:
		_music.stream = _SONG_MAP[selection]
		_song = selection
		if not _music.playing:
			_music.play()

