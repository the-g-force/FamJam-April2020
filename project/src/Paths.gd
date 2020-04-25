extends Node2D

var enemy = preload("res://src/UFO.tscn")
onready var paths = $Paths
var path

func _on_Timer_timeout():
	randomize()
	var UFO = enemy.instance()
	path = paths.get_children()[randi () % paths.get_child_count()]
	path.add_child(UFO)
