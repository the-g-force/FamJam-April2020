extends CanvasLayer

onready var healthtracker = $HBoxContainer/Health
onready var scoretracker = $HBoxContainer/Score

func _process(delta):
	healthtracker.text = "health: " + str(PlayerStats.health)
	scoretracker.text = "score: " + str(PlayerStats.score)
