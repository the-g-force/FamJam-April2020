extends Node2D

export var ufo_speed : float = 100

var enemy = preload("res://src/UFO.tscn")

onready var paths = $Paths

func _on_Timer_timeout():
	var ufo = enemy.instance()
	var path_follow = PathFollow2D.new()
	path_follow.add_child(ufo)
	
	var path = paths.get_children()[randi () % paths.get_child_count()]
	path.add_child(path_follow)

func _process(delta:float):
	for p in $Paths.get_children():
		var path = p as Path2D
		for ufo_path_follow in path.get_children():
			ufo_path_follow.offset += ufo_speed * delta
