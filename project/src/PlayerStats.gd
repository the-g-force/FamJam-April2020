extends Node

const _DEFAULT_HEALTH : int = 10

var health : int 
var score : int 


func _ready():
	reset()


func reset() : 
	health = _DEFAULT_HEALTH
	score = 0
