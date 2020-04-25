extends CanvasLayer

onready var healthtracker = $HBoxContainer/Health
onready var scoretracker = $HBoxContainer/Score

func _process(_delta):
	if PlayerStats.health >= 0:
		healthtracker.text = "health:" + str(PlayerStats.health)
	scoretracker.text = "score:" + str(PlayerStats.score) + " "
